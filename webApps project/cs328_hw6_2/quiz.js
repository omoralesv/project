
		function start()
		{
			var button = document.getElementById( "submitButton");
			button.addEventListener( "click" , display, false );
			
			var show = document.getElementById( "hidden" );
			
			if(show.style.display==="none")
					show.style.display="block";
			else
				show.style.display="none";
		}
		
		
		
		
		
		function display()
		{ 
			question6 = document.getElementById("question6");
			question6 = question6.value;
			
			if(validate(question6) == true)
			{
				var question1 = document.querySelector('input[name="q1"]:checked').value;
				var question2 = document.querySelector('input[name="q2"]:checked').value;
				var question3 = document.querySelector('input[name="q3"]:checked').value;
				var question4 = document.querySelector('input[name="q4"]:checked').value;
				var question5 = document.querySelector('input[name="q5"]:checked').value;
				
				
				var result = document.getElementById( "result" );
				var header = document.getElementById( "header" );
				var show = document.getElementById( "hidden" );
			
			
				header.innerHTML="Here are the results:";
				
				total =score(question1,question2,question3,question4,question5,question6);
				result.innerHTML = "You got " + total + " out of 6 correct!"
				
				
				if(show.style.display==="none")
					show.style.display="block";
				
				header.scrollIntoView();
				
				
			}
		}
	
	
	
	
	
		function validate(question6)
		{
			if (document.querySelectorAll('input[name="q1"]:checked').length === 0) 
				{
					alert("Question 1 not checked");
					return false;
				}
			else if (document.querySelectorAll('input[name="q2"]:checked').length === 0) 
				{
					alert("Question 2 not checked");
					return false;
				}
			else if (document.querySelectorAll('input[name="q3"]:checked').length === 0) 
				{
					alert("Question 3 not checked");
					return false;
				}
			else if (document.querySelectorAll('input[name="q4"]:checked').length === 0) 
				{
					alert("Question 4 not checked");
					return false;
				}
			else if (document.querySelectorAll('input[name="q5"]:checked').length === 0) 
				{
					alert("Question 5 not checked");
					return false;
				}
			else if(question6.length == 0)
				{
					alert("Question 6 was not answered");
					return false;
				}
			
			else
				return true;
		
		}
		
		
		
		
		function score(question1,question2,question3,question4,question5,question6)
		{
			var correct = 0;
			var picture = document.getElementById( "resultImg");
			var quizScore = document.getElementById("quizScore");
			
			
			if(question1 == "donuts")
				correct++;
			
			if(question2 == "thats that")
				correct++;
				
			if(question3 == "Quasimoto")
				correct++;
			
			if(question4 == "true")
				correct++;
			
			if(question5 == "false")
				correct++;
				
			if (question6.toString().toUpperCase() =="GORGEOUS")
				correct++;
			
			if(correct == 0)
				picture.src="https://i.kym-cdn.com/entries/icons/original/000/028/577/pepelaughz.jpg";
			
			else if (correct == 3)
				picture.src="https://streamsentials.com/wp-content/uploads/2021/01/yep-twitch-emote.png";
			
			else if( correct == 4 || correct == 5)
				picture.src="https://i.kym-cdn.com/photos/images/original/001/597/239/c02.png"
			
			else if(correct == 6)
				picture.src="https://www.vhv.rs/file/max/17/176483_ez-emote-png.jpg"
				
			
				quizScore.value=correct;
			
			return correct;
		}
		
		
		
	window.addEventListener( "load", start, false );