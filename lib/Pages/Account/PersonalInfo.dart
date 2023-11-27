import 'package:flutter/material.dart';
import 'package:opensource/Helper/HelperClasses.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorService.loadAndGetColor('iconColor'),
            )),
        title: Text(
          'Personal Info',
          style: TextStyle(color: ColorService.loadAndGetColor('textColor')),
        ),
        centerTitle: true,
        backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
        actions: [
          // popup menu
          PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              color: ColorService.loadAndGetColor('iconColor'),
            ),
            color: ColorService.loadAndGetColor('backgroundColor'),
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(
                child: GestureDetector(
                    child: Row(
                  children: [
                    Icon(
                      Icons.edit,
                      color: ColorService.loadAndGetColor('iconColor'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Edit',
                      style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor')),
                    ),
                  ],
                )),
              ),
              PopupMenuItem(
                  child: GestureDetector(
                      child: Row(
                children: [
                  Icon(
                    Icons.privacy_tip_outlined,
                    color: ColorService.loadAndGetColor('iconColor'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Privacy',
                    style: TextStyle(
                        color: ColorService.loadAndGetColor('textColor')),
                  ),
                ],
              ))),
            ],
          ),
        ],
      ),
      backgroundColor: ColorService.loadAndGetColor('backgroundColor'),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    //bottom border
                    border: Border(
                      bottom: BorderSide(
                        color: ColorService.loadAndGetColor('borderColor'),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        children: [
                          Text(
                            'Username: ',
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            ),
                          ),
                          Text('Mzansi45',
                              style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text('Names: ',
                              style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'),
                              )),
                          Text('Thulani',
                              style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'),
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Surname: ',
                              style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'),
                              )),
                          Text('Gulube',
                              style: TextStyle(
                                color:
                                    ColorService.loadAndGetColor('textColor'),
                              ))
                        ],
                      ),
                    ]),
                    const Spacer(),
                    //edit button
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.drive_file_rename_outline_sharp,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])), // Names, Surname
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Address: ',
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            )),
                        Text('1234, 1234, 1234',
                            style: TextStyle(
                              color: ColorService.loadAndGetColor('textColor'),
                            )),
                        Spacer(),
                        Container(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: ColorService.loadAndGetColor(
                                  'secondaryBackgroundColor'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: ColorService.loadAndGetColor(
                                      'borderColor'),
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add_location_alt_outlined,
                                  color:
                                      ColorService.loadAndGetColor('iconColor'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: ColorService.loadAndGetColor(
                                          'textColor')),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ), // Address
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Date of birth: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('12/12/12',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // Date of birth
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Cell phone: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('1234567890',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone_android_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // cell phone
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Email: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('email@example.com',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // email
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Hobbies: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('Coding, Gaming',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.sports_esports_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // hobbies
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    //bottom border
                    border: Border(
                      bottom: BorderSide(
                        color: ColorService.loadAndGetColor('borderColor'),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Education: ',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  )),
                              Text('BSc Computer Science',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Institution: ',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  )),
                              Text('University of Pretoria',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  ))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Year: ',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  )),
                              Text('2021',
                                  style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor'),
                                  ))
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      //edit button
                      Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: ColorService.loadAndGetColor(
                                'secondaryBackgroundColor'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                color:
                                    ColorService.loadAndGetColor('borderColor'),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.school_outlined,
                                color:
                                    ColorService.loadAndGetColor('iconColor'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Edit',
                                style: TextStyle(
                                    color: ColorService.loadAndGetColor(
                                        'textColor')),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )), // education
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Work: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('Developer',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.work_outline_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // work
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('Languages: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('English, Zulu, Xhosa',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.language_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // languages
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  //bottom border
                  border: Border(
                    bottom: BorderSide(
                      color: ColorService.loadAndGetColor('borderColor'),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text('About: ',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Text('I am a developer',
                        style: TextStyle(
                          color: ColorService.loadAndGetColor('textColor'),
                        )),
                    Spacer(),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: ColorService.loadAndGetColor(
                              'secondaryBackgroundColor'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color:
                                  ColorService.loadAndGetColor('borderColor'),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.abc_outlined,
                              color: ColorService.loadAndGetColor('iconColor'),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Edit',
                              style: TextStyle(
                                  color: ColorService.loadAndGetColor(
                                      'textColor')),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ), // about me
            ],
          ),
        ),
      ),
    );
  }
}
