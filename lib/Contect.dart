import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Contect extends StatefulWidget {
  @override
  _ContectState createState() => _ContectState();
}

class _ContectState extends State<Contect> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getAllContacts();
    });
  }

  getAllContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contact1 =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      setState(() {
        contacts = contact1;
        //print(contacts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("contect"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          Contact contact = contacts[index];
          print(contact.displayName == null ? "NA" : contact.displayName);
          if (contact.phones.isEmpty) {
            return SizedBox(
              height: 1,
            );
          }
          print(contact.phones);
          print("----------------");
          return ListTile(
            title:
                Text(contact.displayName == null ? "NA" : contact.displayName),
            subtitle: Text(contact.phones.elementAt(0).value),
            leading: (contact.avatar != null && contact.avatar.length > 0)
                ? CircleAvatar(backgroundImage: MemoryImage(contact.avatar))
                : CircleAvatar(
                    child: Text(contact.initials()),
                  ),
          );
        },
      ),
    );
  }
}
