extends CanvasLayer

#var user = "admin"
#var password = "password123"

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")
	
func _on_CreateButton_pressed():
	var profile_name = $Panel/NameEdit.text
	var description = $Panel/DescriptionEdit.text
	
	var url = "http://127.0.0.1:8000/profiles/"
	
	var body = {
		"name": profile_name,
		"description": description
	}
	make_post_request(url, body)
	
func make_post_request(url, data):
	# Add Basic Auth
	var auth=str("Basic ", Marshalls.utf8_to_base64(str(user, ":", password)))
	# Add 'Content-Type' header
	var headers = ["Content-Type: application/json","Authorization: "+auth]
	data = JSON.print(data)
	
	var error = $HTTPRequest.request(url, headers, true, HTTPClient.METHOD_POST, data)
	if error != OK:
		push_error("An error occurred in the HTTP request.")
	
	$AcceptDialog.show()
	
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	
	if response_code == 200:
		var json = JSON.parse(body.get_string_from_utf8())
		print(json.result)
		
