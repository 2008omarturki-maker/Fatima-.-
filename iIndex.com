<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>إلى فاطمة ❤️</title>

<style>
*{
  box-sizing:border-box;
  margin:0;
  padding:0;
}

body{
  min-height:100vh;
  background:linear-gradient(135deg,#16001f,#4b073c,#8b164f);
  color:white;
  font-family:Arial,sans-serif;
  display:flex;
  justify-content:center;
  align-items:center;
  overflow:hidden;
}

.container{
  width:92%;
  max-width:500px;
  text-align:center;
  position:relative;
  z-index:2;
}

.card{
  background:rgba(255,255,255,.12);
  backdrop-filter:blur(15px);
  -webkit-backdrop-filter:blur(15px);
  border:1px solid rgba(255,255,255,.2);
  border-radius:30px;
  padding:30px 22px;
  box-shadow:0 20px 60px rgba(0,0,0,.35);
}

h1{
  font-size:32px;
  margin-bottom:15px;
}

p{
  font-size:18px;
  line-height:1.9;
}

.heart{
  font-size:85px;
  cursor:pointer;
  animation:pulse 1.2s infinite;
  user-select:none;
  margin:20px 0;
}

@keyframes pulse{
  0%,100%{transform:scale(1)}
  50%{transform:scale(1.15)}
}

button{
  border:none;
  border-radius:50px;
  padding:14px 25px;
  margin:8px;
  font-size:17px;
  cursor:pointer;
  background:white;
  color:#8b164f;
  font-weight:bold;
  transition:.3s;
}

button:hover{
  transform:scale(1.06);
}

.hidden{
  display:none;
}

.question{
  font-size:23px;
  margin:20px 0;
  font-weight:bold;
}

.answer{
  display:block;
  width:100%;
  margin:10px 0;
}

.message{
  font-size:19px;
  line-height:2;
  margin-top:15px;
}

.love{
  font-size:27px;
  margin-top:20px;
  font-weight:bold;
}

.small{
  opacity:.8;
  margin-top:15px;
  font-size:14px;
}

.floating{
  position:fixed;
  bottom:-30px;
  animation:floatUp linear forwards;
  pointer-events:none;
  z-index:1;
}

@keyframes floatUp{
  0%{
    transform:translateY(0) rotate(0deg);
    opacity:0;
  }
  15%{opacity:1}
  100%{
    transform:translateY(-110vh) rotate(360deg);
    opacity:0;
  }
}
</style>
</head>

<body>

<div class="container">

  <!-- البداية -->
  <div class="card" id="start">

    <h1>إلى فاطمة ❤️</h1>

    <p>
      عندي لك شيء بسيط جدًا...
      <br>
      بس قبل كل شيء لازم تفتحين الظرف 💌
    </p>

    <div class="heart" onclick="openLetter()">💌</div>

    <p class="small">اضغطي على الظرف ✨</p>

  </div>


  <!-- الرسالة -->
  <div class="card hidden" id="letter">

    <h1>يا فاطمة ❤️</h1>

    <p class="message">
      يمكن الكلام ما يوصف كل اللي بداخلي،
      لكن فيه شخص كل ما فكر فيك ابتسم بدون ما يشعر.
      <br><br>

      وجودك بحياتي شيء ما أعتبره عادي،
      وأتمنى دوم أشوفك سعيدة ومبتسمة.
      <br><br>

      والحين عندي لك كم سؤال صغير 😌❤️
    </p>

    <button onclick="nextQuestion()">كملي 💕</button>

  </div>


  <!-- الأسئلة -->
  <div class="card hidden" id="questions">

    <div class="question" id="questionText"></div>

    <div id="answers"></div>

  </div>


  <!-- النهاية -->
  <div class="card hidden" id="final">

    <div class="heart">❤️</div>

    <h1>فاطمة 💕</h1>

    <p class="message">
      مهما كتبت ومهما قلت،
      ما راح أوفيك حقك.
      <br><br>

      أنتِ شخص غالي على قلبي،
      وأتمنى لك السعادة بكل لحظة من حياتك.
      <br><br>

      وإذا سألتيني وش أكثر شيء أبيه؟
      <br>
      أبي أشوفك دايم بخير وبأجمل ابتسامة ❤️
    </p>

    <div class="love">
      وتذكري دايم...<br>
      عمر بمووووت فيك ويعشقك واااايد ❤️🌹
    </div>

    <p class="small">
      من عمر إلى فاطمة 💌
    </p>

  </div>

</div>


<script>

const questions = [

  {
    text:"ايش أكثر اسم تحبين تنادين عمر فيه؟ 😌❤️",
    answers:[
      "عمر ❤️",
      "عموري 🥹",
      "حبيبي 💕",
      "كلهم 😭❤️"
    ]
  },

  {
    text:"قد ايش تحبين عمر؟ 🥹",
    answers:[
      "شوي 🤏",
      "كثير ❤️",
      "وايددد 😭💕",
      "أكثر مما تتخيل 😭❤️"
    ]
  },

  {
    text:"لو عمر زعلك، وش تسوين؟ 🥺",
    answers:[
      "أزعل عليه 😭",
      "أطنشه شوي 😂",
      "أخليه يراضيني ❤️",
      "أسامحه بسرعة 🥹"
    ]
  },

  {
    text:"وأخيرًا... هل عمر غالي عليك؟ ❤️",
    answers:[
      "أكيد ❤️",
      "طبعًااا 🥹",
      "غالي وايد 💕",
      "أغلى مما تتوقع 😭❤️"
    ]
  }

];

let currentQuestion=0;

function openLetter(){

  document.getElementById("start").classList.add("hidden");

  document.getElementById("letter").classList.remove("hidden");

  createHearts();
}

function nextQuestion(){

  document.getElementById("letter").classList.add("hidden");

  document.getElementById("questions").classList.remove("hidden");

  showQuestion();

}

function showQuestion(){

  const q=questions[currentQuestion];

  document.getElementById("questionText").innerHTML=q.text;

  const answers=document.getElementById("answers");

  answers.innerHTML="";

  q.answers.forEach(answer=>{

    const btn=document.createElement("button");

    btn.className="answer";

    btn.innerHTML=answer;

    btn.onclick=()=>selectAnswer();

    answers.appendChild(btn);

  });

}

function selectAnswer(){

  currentQuestion++;

  if(currentQuestion < questions.length){

    showQuestion();

  }else{

    document.getElementById("questions").classList.add("hidden");

    document.getElementById("final").classList.remove("hidden");

    createHearts();

  }

}

function createHearts(){

  for(let i=0;i<18;i++){

    setTimeout(()=>{

      const heart=document.createElement("div");

      heart.className="floating";

      heart.innerHTML=["❤️","💕","💗","💖","🌹","✨"][Math.floor(Math.random()*6)];

      heart.style.left=Math.random()*100+"vw";

      heart.style.fontSize=(18+Math.random()*25)+"px";

      heart.style.animationDuration=(4+Math.random()*5)+"s";

      document.body.appendChild(heart);

      setTimeout(()=>{
        heart.remove();
      },9000);

    },i*250);

  }

}

</script>

</body>
</html>