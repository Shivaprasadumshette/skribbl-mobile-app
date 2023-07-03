import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scribble_app/paint_screen.dart';
import 'package:scribble_app/widgets/custom_text_field.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNameController = TextEditingController();
  late String? _maxRoundValue;
  late String? _roomSizeValue;

    void createRoom(){
      if(_nameController.text.isNotEmpty && _roomNameController.text.isNotEmpty && _maxRoundValue!=null && _roomSizeValue!=null){
        Map<String,String> data ={
          "nickname": _nameController.text,
          "name": _roomNameController.text,
          "occupancy": _roomSizeValue!,
          "maxRounds": _maxRoundValue!
        };
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PaintScreen(data: data, screenForm:'createRoom')));
      }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Create Room",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.08,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextField(
            nameController: _nameController,
            hintText: "Enter your Name",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomTextField(
            nameController: _roomNameController,
            hintText: "Enter Room name",
          ),
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          items: <String>["2", "5", "10", "15"]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          hint: const Text('Max Round',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
          onChanged: (String? value) {
            setState(() {
              _maxRoundValue = value;
            });
          },
        ),
        SizedBox(
          height: 20,
        ),
        DropdownButton<String>(
          items: <String>["2", "3", "4", "5", "6", "7"]
              .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              )
              .toList(),
          hint: const Text('Max Players',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14)),
          onChanged: (String? value) {
            setState(() {
              _roomSizeValue = value;
            });
          },
        ),
        SizedBox(height: 40),
        ElevatedButton(
            onPressed: createRoom,
            child: const Text("create",
                style: TextStyle(color: Colors.white, fontSize: 16)
            ), style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            textStyle: MaterialStateProperty.all(
                TextStyle(color: Colors.white)),
            minimumSize: MaterialStateProperty.all(Size(MediaQuery
                .of(context)
                .size
                .width / 2.5, 50))
        ),
        )
      ],
    ));
  }
}
