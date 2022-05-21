import 'package:book/main.dart';
import 'package:book/quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class BookContentSlides extends StatefulWidget {
  const BookContentSlides({Key? key}) : super(key: key);

  @override
  State<BookContentSlides> createState() => _BookContentState();
}

class _BookContentState extends State<BookContentSlides> {
  List <Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        description: "وقف مازن على شرفة تطل على البحر يراقب الشمس وهي تغرب وراء الأفق. أعجبه منظرها، فقال لها أيتها الشمس الحلوة! رأيتك عند الصباح",
        styleDescription: const TextStyle(
        color: Colors.black,
        fontSize: 20.0, ),
        //fontStyle: FontStyle.italic,
        //fontFamily: 'Raleway',)
        pathImage: "images/33.png",
        widthImage: 100 ,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        marginTitle: const EdgeInsets.only(top: 0),
        description: "تملئين الدنيا بنورك، وفي الظهيرة كنت تبعثين حرا شديدا، وها أنت الآن ترحلين عنا بهذا الجمال الرائع، فما أنت؟ وما شأنك؟ وقف الشمس في مغربها وأجاب قائلة : إن حکایتي طويلة - يا مازن - وأسراري غريبة، ولكني سأشرحها لك، لأنك طفل ذكي تحب أن تعرف كل شيء، وأنا أحب أمثالك من الأطفال . أنت الآن، یا مازن، تراني قرصا صغيرا يسبح في الفضاء، وتحسب أني قريبه منك، وربماظننت أني أقف على رأس الجبل أحيانا وأغطس في البحر أحيانا أخرى، ولكن  بين الحقيقة غير ذلك یا مازن. قال مازن : ",
        styleDescription: const TextStyle(
          color: Colors.black,
          fontSize: 20.0, ),
        //fontStyle: FontStyle.italic,
        //fontFamily: 'Raleway',)
        pathImage: "images/34.png",
        widthImage: 100 ,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      Slide(
        marginTitle: const EdgeInsets.only(top: 0),
        description: "ما هي الحقيقة ؟ أيها الشمس اللطيفة ! فأجابته الشمس : أنا، یا مازن، لست گرة صغيرة كما تراني، ولكي كرة كبيرة، كبير جدا، وأكبر مما تستطيع عينك أن ترى، بل أكبر من الأرض التي تعيش عليها بمرات كثيرة . قال مازن: وكيف ذلك؟ فردت عليه الشمس تقول: أجل یا مازن : أنا هكذا كبيرة ولكنك تراني صغيرة، لأني بعيدةما هي الحقيقة ؟ أيها الشمس اللطيفة ! فأجابته الشمس : أنا، یا مازن، لست گرة صغيرة كما تراني، ولكي كرة كبيرة، كبير جدا، وأكبر مما تستطيع عينك أن ترى، بل أكبر من الأرض التي تعيش عليها بمرات كثيرة . قال مازن: وكيف ذلك؟ فردت عليه الشمس تقول: أجل یا مازن : أنا هكذا كبيرة ولكنك تراني صغيرة، لأني بعيدة",
        styleDescription: const TextStyle(
          color: Colors.black,
          fontSize: 20.0, ),
        //fontStyle: FontStyle.italic,
        //fontFamily: 'Raleway',)
        pathImage: "images/35.png",
        widthImage: 100 ,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );

    slides.add(
      Slide(
        marginTitle: const EdgeInsets.only(top: 0),
        description: " أحبكم ، ولأني أحبكم ابتعدت عنكم، ولو اقترب منكم لحرقتم وحرق كل ما على الأرض. قال مازن مستغربا: كيف تحريقيننا وتحرقين كل ما على الأرض؟ ألست تحبيننا كما تقولين؟ فأجاب الشمس: ألم أقل لك: لأني أحبكم ابتعد عنكم، وسأشرح لك كل شيء عند الغروب الآتي، فاذهب الآن إلى أمك بسلام. عاد مازن إلى أمه كما قالت له الشمس، وتناول طعام العشاء، ثمأوى إلى سريره، وفي نفسه ما فيها من انتظارلمساء اليوم التالي، ليسمع ما تقول له الشمس.",
        styleDescription: const TextStyle(
          color: Colors.black,
          fontSize: 20.0, ),
        //fontStyle: FontStyle.italic,
        //fontFamily: 'Raleway',)
        pathImage: "images/36.png",
        widthImage: 100 ,
        heightImage: 250,
        backgroundColor: Colors.white,
      ),
    );

  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0x33FFA8B0)),

    );
  }

  Widget renderNextBtn() {
    return const Text("التالي", style: TextStyle(fontSize: 20, color: Colors.white),);
  }

  void onDonePress() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const QuizPage()),);
  }
  Widget renderDoneBtn() {
    return const Text("الأسئلة", style: TextStyle(fontSize: 20, color: Colors.white),);
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      renderNextBtn: renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      renderDoneBtn: renderDoneBtn(),
      onDonePress: onDonePress,
      doneButtonStyle: myButtonStyle(),
      slides: slides,
    );
  }
}