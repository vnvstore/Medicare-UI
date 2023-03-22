import 'package:flutter/material.dart';
import 'package:medicare/styles/colors.dart';
import 'package:medicare/styles/styles.dart';

List<Map> doctors = [
  {
    'img': 'assets/doctor01.jpeg',
    'doctorName': 'Dr. Brick Wall',
    'doctorTitle': 'Heart Specialist',
    'category': 'Consultation',
  },
  {
    'img': 'assets/doctor02.png',
    'doctorName': 'Dr. Gardner Pearson',
    'doctorTitle': 'Heart Specialist',
    'category': 'Skin',
  },
  {
    'img': 'assets/doctor03.jpeg',
    'doctorName': 'Dr. Rosa Williamson',
    'doctorTitle': 'Skin Specialist',
    'category': 'Consultation',
  },

  {
    'img': 'assets/doctor04.jpeg',
    'doctorName': 'Dr. Toothman',
    'doctorTitle': 'Skin Specialist',
    'category': 'Dental',
  },


  {
    'img': 'assets/doctor05.jpeg',
    'doctorName': 'Dr. Lachinet',
    'doctorTitle': 'Heart Specialist',
    'category': 'Consultation',
  },
  {
    'img': 'assets/doctor06.jpeg',
    'doctorName': 'Dr. Bonebrake',
    'doctorTitle': 'Skin Specialist',
    'category': 'Consultation',
  },
  {
    'img': 'assets/doctor07.jpeg',
    'doctorName': 'Dr. Donald Duckles',
    'doctorTitle': 'Heart Specialist',
    'category': 'Skin',
  },
  {
    'img': 'assets/doctor08.png',
    'doctorName': 'Dr. Finger',
    'doctorTitle': 'Skin Specialist',
    'category': 'Dental',
  },
  {
    'img': 'assets/doctor09.jpeg',
    'doctorName': 'Dr. Drewel',
    'doctorTitle': 'Heart Specialist',
    'category': 'Consultation',
  },
  {
    'img': 'assets/doctor10.jpeg',
    'doctorName': 'Dr. Puppala',
    'doctorTitle': 'Skin Specialist',
    'category': 'Consultation',
  },


];


final textController = TextEditingController();
String selectedCategory = "";

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen>{

  List<Map> filter = doctors;


  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    textController.addListener(_onInputChange);
  }

  void _onInputChange() {
    filterDoctors();
  }

  void onPressedCategory(String categoryName) {
    selectedCategory = categoryName;
    filterDoctors();
  }
  void filterDoctors(){
    filter = doctors;
    if(textController.text.isNotEmpty) {
      filter = filter.where((doctor)=>doctor["doctorName"].toString().toLowerCase().contains(textController.text.toLowerCase())).toList();
    }
    if(selectedCategory.isNotEmpty){
      filter = filter.where((doctor)=>doctor["category"]==selectedCategory).toList();
    }
    setState(() {});

  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child:Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Find a Doctor',
              textAlign: TextAlign.center,
              style: kScreenTitleStyle,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(
                children: [
                  SearchInput(),
                  SizedBox(
                    height: 20,
                  ),
                  CategoryIcons(onPressedCategory: onPressedCategory),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Popular Doctors',
                    style: TextStyle(
                      color: Color(MyColors.header01),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  for (var doctor in filter)
                    TopDoctorCard(
                      img: doctor['img'],
                      doctorName: doctor['doctorName'],
                      doctorTitle: doctor['doctorTitle'],
                    )
                ],
              ),
            )
          ])),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }


}

class TopDoctorCard extends StatelessWidget {
  String img;
  String doctorName;
  String doctorTitle;


  TopDoctorCard({
    required this.img,
    required this.doctorName,
    required this.doctorTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Row(
          children: [
            Container(
              color: Color(MyColors.grey01),
              child: Image(
                width: 100,
                image: AssetImage(img),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorName,
                  style: TextStyle(
                    color: Color(MyColors.header01),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  doctorTitle,
                  style: TextStyle(
                    color: Color(MyColors.grey02),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(MyColors.yellow02),
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '4.0 - 50 Reviews',
                      style: TextStyle(color: Color(MyColors.grey02)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


List<Map> categories = [
  {'text': 'Consultation', 'image': 'assets/icons/stethoscope.png'},
  {'text': 'Dental', 'image': 'assets/icons/teeth.png'},
  {'text': 'Heart', 'image': 'assets/icons/heart.png'},
  {'text': 'Hospitals', 'image': 'assets/icons/clinic.png'},
  {'text': 'Medicines', 'image': 'assets/icons/medicine.png'},
  {'text': 'Physician', 'image': 'assets/icons/care.png'},
  {'text': 'Skin', 'image': 'assets/icons/bandage.png'},
  {'text': 'Surgeon', 'image': 'assets/icons/syringe.png'},
];

class CategoryIcons extends StatelessWidget {

  final void Function(String) onPressedCategory;

  const CategoryIcons({
    required this.onPressedCategory,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget row = Row(
      children: [
        for (var category in categories)
          CategoryImageIcon(
              image: category['image'],
              text: category['text'],
              isSelected: selectedCategory == category['text'],
              onTap: onPressedCategory,
            ),

      ],
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: row,
    );
  }
}

class CategoryImageIcon extends StatefulWidget {



  final String image;
  final String text;
  bool isSelected;
  void Function(String) onTap;



  CategoryImageIcon({Key? key,required this.image,required this.text,required this.isSelected,required this.onTap}) : super(key: key);

  @override
  State<CategoryImageIcon> createState() => _CategoryImageIconState();
}

class _CategoryImageIconState extends State<CategoryImageIcon>{



  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Color(MyColors.bg01),
      onTap: () {
        if(widget.isSelected){
          widget.onTap("");
        }else{
          widget.onTap(widget.text);
        }

      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: widget.isSelected?Color(MyColors.primary):Color(MyColors.bg),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Image.asset(
                widget.image,
                color: widget.isSelected?Colors.white:Color(MyColors.primary),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Color(MyColors.primary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search,
              color: Color(MyColors.purple02),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search a doctor',
                hintStyle: TextStyle(
                    fontSize: 13,
                    color: Color(MyColors.purple01),
                    fontWeight: FontWeight.w700),
                suffixIcon: IconButton(
                  onPressed: textController.clear,
                  icon: Icon(Icons.clear,color: Color(MyColors.primary)),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
