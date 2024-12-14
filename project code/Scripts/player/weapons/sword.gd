class_name Sword
extends Weapon

func get_hit_data():
	return holder.current_move.form_hit_data(self)
