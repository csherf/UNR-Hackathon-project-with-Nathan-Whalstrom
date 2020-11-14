class_name Util

static func from_group(group, caller):
	var list = caller.get_tree().get_nodes_in_group(group)
	if list.size() > 0:
		return list[0]
	else:
		return null
