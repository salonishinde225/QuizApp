import"package:flutter/material.dart";
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner:false,
      home:QuizApp(),
    );
  }
}
class QuizApp extends StatefulWidget{
    const QuizApp({super.key});
   
    @override
    State createState() =>_QuizAppState();
  }class _QuizAppState extends State{
    List<Map>allQuestions=[
      {
        "question":"Who is the founder of Microsoft?",
        "Options":["Steve Jobs","Bill Gates","Lary Page", "Elon Musk"],
        "correctAnswer":1
      },
      {
        "question":"Who is the founder of Google?",
        "Options":["Steve Jobs","Bill Gates","Lary Page", "Elon Musk"],
        "correctAnswer":2
      },
      {
        "question":"Who is the founder of SpaceX?",
        "Options":["Steve Jobs","Bill Gates","Lary Page", "Elon Musk"],
        "correctAnswer":3
      },
      {
        "question":"Who is the founder of Apple?",
        "Options":["Steve Jobs","Bill Gates","Lary Page", "Elon Musk"],
        "correctAnswer":0
      },
       {
        "question":"Who is the founder of Meta?",
        "Options":["Steve Jobs","Mark Zukerberg","Lary Page", "Elon Musk"],
        "correctAnswer":1
      },
    ];
    int currentQuestionIndex=0;
    int selectedAnswerIndex =-1;
    int score = 0;
    int pageNo = 0;

    WidgetStateProperty<Color?> checkAnswer(int answerIndex){
      if (selectedAnswerIndex !=-1){
        if (answerIndex==allQuestions[currentQuestionIndex]["correctAnswer"]){
          score++;
          return const WidgetStatePropertyAll(Colors.green);
        }else if(selectedAnswerIndex == answerIndex){
          score--;
           return const WidgetStatePropertyAll(Colors.red);
        }else{
          return const WidgetStatePropertyAll(null);
        }
      }else{
        return const WidgetStatePropertyAll(null);
      }
    }
    bool questionPage = true;
    
  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
  Scaffold isQuestionScreen(){
  if (questionPage==true){
   return Scaffold(
    backgroundColor: const Color.fromARGB(255, 243, 242, 242),
    
      appBar: AppBar(
        title:const Text(
          "QuizApp",
          style:TextStyle(
            fontSize:30,
            fontWeight: FontWeight.w600,
            color:Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [ 
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
            const SizedBox(
              width: 120,
            ),
            Text(
              "Question: ${currentQuestionIndex+1}/${allQuestions.length}",
              style:const TextStyle(
                fontSize:28,
                fontWeight: FontWeight.w600,
                 color:Color.fromARGB(255, 125, 124, 124),
              ),
            ),
          ],
          ),
           const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 380,
            height: 50,
            child: Text(
              allQuestions[currentQuestionIndex] ["question"],
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color:Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style : ButtonStyle(
                backgroundColor:checkAnswer(0),
               ),
              onPressed: (){
                if (selectedAnswerIndex ==-1){
                  selectedAnswerIndex =0;
                  setState(() {});
                }
              },
                child:Text(
                "A.${allQuestions[currentQuestionIndex]['Options'][0]}",
                style: const TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style : ButtonStyle(
                backgroundColor:checkAnswer(1),
               ),
              onPressed: () {
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex = 1;
                  setState(() {});
                }
              },
              child:Text(
                "B.${allQuestions[currentQuestionIndex]['Options'][1]}",
              style: const TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),        
        const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              style : ButtonStyle(backgroundColor:checkAnswer(2),
               ),
              onPressed: () {
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex = 2;
                  setState(() {});
                }
              },
              child:Text(
                "C.${allQuestions[currentQuestionIndex]['Options'][2]}",
              style: const TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ),const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 50,
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                if (selectedAnswerIndex == -1){
                  selectedAnswerIndex = 3;
                  setState(() {});
                }
              },
              style : ButtonStyle(backgroundColor:checkAnswer(3),
               ),
              child:Text(
                "D.${allQuestions[currentQuestionIndex]['Options'][3]}",
              style: const TextStyle(
                fontSize:20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),  
        ),
      ],
    ), 
    floatingActionButton: FloatingActionButton(
      onPressed:(){
        if (selectedAnswerIndex!=-1){
        if (currentQuestionIndex < allQuestions.length-1){
          currentQuestionIndex++;
        }else{
          questionPage =false;
        }
        selectedAnswerIndex =-1;
        setState(() {});
        }
      },
      backgroundColor:Colors.purple,
      child:const Icon(
        Icons.forward,
        color:Colors.white,
      ),
    ),
  );
} else{return Scaffold(
  backgroundColor: const Color.fromARGB(255, 243, 242, 242),
    appBar: AppBar( 
    title:const Text(
      "Quiz Result",
      style:TextStyle( 
     fontSize:30,
     fontWeight: FontWeight.w600,
     color: Colors.black,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.purple,
  ),
  body:Center(
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9uzHUjjn919NoHdvEQvTKbcnctMBo6a4pkA&s ",
          height:300,
        ),
        const SizedBox(height:30),
        const Text(
        "Congratulations",
        style:TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.orange,
        ),
      ),
      const SizedBox(height: 30),
            Text(
              "Score: $score/${allQuestions.length}", 
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
            height: 25,
          ),
          SizedBox(
            height:60,
            width: 300,
            child: ElevatedButton(
            onPressed: () {
              if(currentQuestionIndex == allQuestions.length-1 ){
                 currentQuestionIndex = 0;
                 selectedAnswerIndex = -1;
                 score = 0;
                 questionPage = true; 
                setState(() {});
              }
            }, 
            style : const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.purple),
              ),
              child:const Text(
                "restart",
              style: TextStyle(
                fontSize:22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),  
        ),
      ],
    ),
  ),
  );
  }
  }
  }
      