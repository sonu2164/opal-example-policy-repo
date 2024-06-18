# Role-based Access Control (RBAC)
# --------------------------------

package app.rbac

# import data.utils

# By default, deny requests
default allow = false

# Allow chefs to do anything

allow {
	user_is_admin
}

allow {
	some i, j
	user := data.users[i]
    note := data.notes[j]
	user.id == input.user
	note.id == input.note
	user.id == note.owner
}



# user_is_admin is true if...

user_is_admin {
	some i
	data.users[i].id == input.user
	data.users[i].role == "admin"
}
