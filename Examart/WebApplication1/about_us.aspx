<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about_us.aspx.cs" Inherits="WebApplication1.about_us" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="icon" href="icon.png" type="image/x-icon"/>
    <meta charset="utf-8" />
    <link href="Home.css" rel="stylesheet" />
    <title>About Examart</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="div2">
            <div id="div1">
		<div class="logoscale"><a href="Home.aspx"><img src="examart.png" alt="logo" class="logo"/></a></div>
                <a href="profile.aspx">
            <asp:Image ID="image" CssClass="user" runat="server" Height="25px" AlternateText="Profile"/></a>
		</div></div>
        <input type="checkbox" id="check"/>
        <label for="check" class="checkbtn">
            <img src="bar.png" class="bar" title="Menu"/>
        </label>

      <div><img src="about.jpg" alt="Welcome" style="width:100%"/></div>  
      <div>
      <ul>
        <li><a href="Home.aspx">Home</a></li>
        <li><a href="complete_exam.aspx">Completed Exams</a></li>
        <li><a href="grades.aspx">Grades</a></li>
        <li><a href="feed_back.aspx">Discussion Form</a></li>
        <li><a href="resources.aspx">Resources</a></li>
        </ul></div><hr/>
        <p style="font-family:'Times New Roman';font-size:25px;margin:10px; text-align:justify;"> Examination is a test of a person’s capacity, knowledge, and ability. 
            It proves what standard of learning a person has acquired during a specific period of time in a specific syllabus. 
            It is the most hated and most shunned things for some students who never like to indulge in it with pleasure until they have a charm of acquiring a degree. 
            Otherwise, they compare it with a nightmare.
            Yet examinations are not totally devoid of good. 
            There is a saying about it.<br />
            The system of education of mostly examination ridden which aims at the test of achievement and success. The examination is the center of studies and hard work. It is a motivating force to work. 
            Its importance and efficacy have been called in question. The most important point is that examinations are not the real test of knowledge and understanding. 
            They are the test of ignorance or cramming. Still, we can say that examinations are necessary evil which cannot be avoided. <br />
            The examinations are a test of nerves. All examinations have a limit of time and place. A student is tested at a bad place and in a bad manner. 
            The question arises how a student’s hard work and worth for a semester or full one year is judged in a short time. They are never a foolproof test of one’s ability. 
            They are the test of one’s memory and writing/typing speed.<br />
            Examinations are a game of chance. The success is so uncertain that the student remain confused. They are never sure, of their success. 
            There are always doubts in their minds, success does not depend on complete preparation. 
            Even the students will full preparation may not succeed or secure good marks. On the other hand, a student with less preparation may easily succeed. 
            So, examinations prove to be a lottery.<br />
            Examinations are a test of memory. They are useful for unintelligent students. In other words, examinations are useful or crammer and harmful for intelligent students. 
            As a matter of fact, such examinations are a curse for able students. 
            Examinations of these kinds discourage hard work. They encourage selective study and some special tricks to get through them. 
            So, difference between learned and ignorant can be made. <b>So our aim is to teach students how to manage the time during exam and environment of the examination</b>.<br /> @all rights reserved-- Gazi Md Nasim.
        </p>
        <div id="footer"><hr style="width:80%"/>
            <h1 class="name">Examart</h1>
            <a href="contact_us.aspx" class="extralink">Contact us</a><br/>
            <a class="extralink">About</a>
        </div>
    </form>
</body>
</html>
