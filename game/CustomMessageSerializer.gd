extends "res://addons/godot-rollback-netcode/MessageSerializer.gd"

const input_path_mapping := {
	'/root/Main/FighterGame/ServerInputInterpreter': 1,
	'/root/Main/FighterGame/ClientInputInterpreter': 2,
}
#const input_path_mapping := {
#	'/root/WebRTCConnect/WebRTCMain/FighterGame/ServerInputInterpreter': 1,
#	'/root/WebRTCConnect/WebRTCMain/FighterGame/ClientInputInterpreter': 2,
#}

enum HeaderFlags {
	HAS_INPUT_VECTOR = 1 << 0,
}

var input_path_mapping_reverse := {}

func _init() -> void:
	for key in input_path_mapping:
		input_path_mapping_reverse[input_path_mapping[key]] = key

func serialize_input(all_input: Dictionary) -> PackedByteArray:
	var buffer := StreamPeerBuffer.new()
	buffer.resize(16)
	
	buffer.put_u32(all_input['$'])
	buffer.put_u8(all_input.size() - 1)
	for path in all_input:
		if path == '$':
			continue
		buffer.put_u8(input_path_mapping[path])
		
		var header := 0
		
		var input = all_input[path]
		if input.has(Enums.PlayerInput.InputVector):
			header |= HeaderFlags.HAS_INPUT_VECTOR
		
		buffer.put_u8(header)
		
		if input.has(Enums.PlayerInput.InputVector):
			var input_vector: int = input[Enums.PlayerInput.InputVector]
			buffer.put_64(input_vector)
	
	buffer.resize(buffer.get_position())
	return buffer.data_array

func unserialize_input(serialized: PackedByteArray) -> Dictionary:
	var buffer := StreamPeerBuffer.new()
	buffer.put_data(serialized)
	buffer.seek(0)
	
	var all_input := {}
	
	all_input['$'] = buffer.get_u32()
	
	var input_count = buffer.get_u8()
	if input_count == 0:
		return all_input
	
	var path = input_path_mapping_reverse[buffer.get_u8()]
	var input := {}
	
	var header = buffer.get_u8()
	if header & HeaderFlags.HAS_INPUT_VECTOR:
		input[Enums.PlayerInput.InputVector] = buffer.get_64()
	
	all_input[path] = input
	return all_input
