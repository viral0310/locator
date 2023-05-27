import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String micPermission = "";
  String cameraPermission = "";
  String storagePermission = "";
  String allPermission = "";
  openAppSetting() async {
    await Permission.location.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Permission handler App"),
        actions: [
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    child: ListTile(
                      onTap: () async {
                        PermissionStatus contacttatus =
                            await Permission.contacts.request();

                        if (contacttatus == PermissionStatus.granted) {}
                        if (contacttatus == PermissionStatus.denied) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("This permission is recommended"),
                            ),
                          );
                        }
                        if (contacttatus ==
                            PermissionStatus.permanentlyDenied) {
                          openAppSettings();
                        }
                      },
                      leading: const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.contacts),
                      ),
                      title: const Text("Contacts permission"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.all(10),
                    child: Center(
                      child: ListTile(
                        onTap: () async {
                          PermissionStatus calendertatus =
                              await Permission.calendar.request();

                          if (calendertatus == PermissionStatus.granted) {}
                          if (calendertatus == PermissionStatus.denied) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("This permission is recommended"),
                              ),
                            );
                          }
                          if (calendertatus ==
                              PermissionStatus.permanentlyDenied) {
                            openAppSettings();
                          }
                        },
                        leading: const CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.calendar_today_outlined),
                        ),
                        title: const Text("Calendar permission"),
                      ),
                    )),
              ),
              SizedBox(
                height: 100,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(10),
                  child: Center(
                    child: ListTile(
                      onTap: () async {
                        PermissionStatus camerastatus =
                            await Permission.camera.request();

                        if (camerastatus == PermissionStatus.granted) {}
                        if (camerastatus == PermissionStatus.denied) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("This permission is denied"),
                            ),
                          );
                        }
                        if (camerastatus ==
                            PermissionStatus.permanentlyDenied) {
                          openAppSettings();
                        }
                      },
                      leading: const CircleAvatar(
                        radius: 40,
                        child: Icon(Icons.camera),
                      ),
                      title: const Text("Camera permission"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: 100,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: ListTile(
                          onTap: () async {
                            PermissionStatus storagestatus =
                                await Permission.storage.request();

                            if (storagestatus == PermissionStatus.granted) {}
                            if (storagestatus == PermissionStatus.denied) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("This permission is denied"),
                                ),
                              );
                            }
                            if (storagestatus ==
                                PermissionStatus.permanentlyDenied) {
                              openAppSettings();
                            }
                          },
                          leading: const CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.store),
                          ),
                          title: const Text("Storage permission"),
                        ),
                      ))),
              SizedBox(
                  height: 100,
                  child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      margin: const EdgeInsets.all(10),
                      child: Center(
                        child: ListTile(
                          onTap: () async {
                            Map<Permission, PermissionStatus> status = await [
                              Permission.storage,
                              Permission.microphone,
                              Permission.camera,
                              Permission.calendar,
                              Permission.contacts,
                            ].request();

                            debugPrint(status.toString());
                          },
                          leading: const CircleAvatar(
                            radius: 40,
                            child: Icon(Icons.apps_rounded),
                          ),
                          title: const Text("All permission"),
                        ),
                      ))),
            ],
          )),
    );
  }
}
