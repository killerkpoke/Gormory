extends CanvasLayer

var json
var access_token 
var refresh_token
var BASE_URL = "http://127.0.0.1:8000"

#func _ready():
#	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_LoginButton_button_up():
	var user_name = $Panel/UserEdit.text
	var pwd = $Panel/PwdEdit.text
	
	getToken(user_name, pwd)
	
func getToken(user, pwd):
	var url = BASE_URL+"/auth/jwt/create"
	
	var auth=str("Basic ", Marshalls.utf8_to_base64(str(user, ":", pwd)))
	var headers = ["Content-Type: application/json","Authorization: "+auth]
	
	var data = {
		"username": user,
		"password": pwd
	}
	data = JSON.print(data)
	
	var error = $HTTPRequest.request(url, headers, true, HTTPClient.METHOD_POST, data)
	
	if error != OK:
		push_error("An error occurred in the HTTP request.")
		
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var temp_json = JSON.parse(body.get_string_from_utf8())
		json = temp_json.result
		$AcceptDialog.dialog_text = "JWT Generated"
	else:
		$AcceptDialog.dialog_text = "Error"
		json = null
	
	$AcceptDialog.show()

func _on_AcceptDialog_confirmed():
	$Panel/TokenEdit.text = str(json)
	if json != null:
		access_token = json.access
		refresh_token = json.refresh
