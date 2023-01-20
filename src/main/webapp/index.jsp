<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Students Reporting System</title>
    <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>  
    <style>
      * {
        margin: 0px;
        padding: 0px;
      }
      .contentWrapper {
        width: 100%;
        position: relative;
        padding: 2em;
        border-radius: 30px;
        background-color: hsl(0, 0%, 100%);
        box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.4);
      }
      body {
        min-height: 100vh;
        display: grid;
        place-content: center;
        text-rendering: optimizeSpeed;
        padding: 2em;
        background: linear-gradient(
          90deg,
          hsla(328, 75%, 45%, 1) 0%,
          hsla(269, 85%, 41%, 1) 100%
        );

        line-height: 1.4;
        font-family: "Work Sans", sans-serif;
      }
      .content {
        overflow: hidden;
        z-index: 1000;
        animation: fadeIn 1s ease-in-out;
      }
      .form-group {
        display: flex;
        flex-direction: column;
      }
      .formGroup label {
        display: inline-block;
        margin: 0.5em 0;
        font-size: 1.3em;
        font-weight: 400;
        color: #1f1414;
      }

      .formGroup input[type="submit"] {
        height: 40px;
        padding: 0 0.5em;
        font-weight: 1.5rem;
        font-weight: 400;
        color: hsl(0, 0%, 10%);
        outline: 0;
        border: 1px solid #e5e1e1;
      }
      .formGroup input[type="number"] {
        height: 40px;
        padding: 0 0.5em;
        font-weight: 1.5rem;
        font-weight: 400;
        color: hsl(0, 0%, 10%);
        outline: 0;
        border: 1px solid #e5e1e1;
      }
      .formGroup input[type="text"] {
        height: 40px;
        padding: 0 0.5em;
        font-weight: 1.5rem;
        font-weight: 400;
        color: hsl(0, 0%, 10%);
        outline: 0;
        border: 1px solid #e5e1e1;
      }
      .formGroup input[type="reset"] {
        height: 40px;
        padding: 0 0.5em;
        font-weight: 1.5rem;
        font-weight: 400;
        color: hsl(0, 0%, 10%);
        outline: 0;
        border: 1px solid #e5e1e1;
      }

      .formGroup input::placeholder  {
        color: #b3b3b3;
      }

      .formGroup div {
        display: flex;
        align-items: center;
        gap: 0.5em;
        margin: 1em 0;
      }
      .formGroup div span select{
        color: hsl(203, 6%, 41%);
        cursor: pointer;
        user-select: none;
      }

      input,
      label,
      small,
      button {
        display: block;
      }
      input[type="text"] {
        height: 1rem;
        width: 10rem;
        margin: 2px;
        padding: 2px;
        border-radius: 10px;
      }
      input[type="number"] {
        height: 1rem;
        width: 10rem;
        margin: 2px;
        padding: 2px;
        border-radius: 10px;
      }
      input[type="submit"] {
        width: 100%;
        padding: 0.75em 1em;
        margin: 0.9em 0 0 0;
        border: 0;
        outline: 0;
        letter-spacing: 1px;
        border-radius: 30px;
        background: linear-gradient(
          90deg,
          hsla(328, 75%, 45%, 1) 0%,
          hsla(269, 85%, 41%, 1) 100%
        );
        color: hsl(0, 0%, 100%);
        cursor: pointer;
      }
      
      input[type="reset"] {
        width: 100%;
        padding: 0.75em 1em;
        margin: 0.1em 0 0 0;
        border: 0;
        outline: 0;
        letter-spacing: 1px;
        border-radius: 30px;
        background: linear-gradient(
          90deg,
          hsla(328, 75%, 45%, 1) 0%,
          hsla(269, 85%, 41%, 1) 100%
        );
        color: hsl(0, 0%, 100%);
        cursor: pointer;
      }
      #addStudents {
        border: 1px solid hsla(269, 85%, 41%, 1) 100%;
      }
      #output {
        width: 104%;
        background-color: white;
        margin-top: 2rem;
        padding: 1rem;
        box-shadow: 0px 10px 10px rgba(0, 0, 0, 0.4);;
      }
      #output form{
        margin-top: 1rem;
        margin-bottom: 1rem;
        
    }
      #output p{
        margin-top: 1rem;
        margin-bottom: 1rem;
      }
      #output span{
        background-color:lavender;
        box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.4);
        height: 5px;
        padding: 2px;
        border-radius: 5%;
      }
      .sel{
        font-size: 20px;
      }
    </style>
  </head>
  <body>
    <div id="addStudents" class="contentWrapper">
        <h2>Student Reports</h2>
      <form id="studentForm" class="formGroup">
        <div id="std">
          <div id="ndiv">
            <label for="name">Name :</label>
            <input
              type="text"
              id="name"
              name="name"
              placeholder="Enter Student Name"
            />
          </div>
          <div id="rdiv">
            <label for="rollNo">Roll No :</label>
            <input
              type="number"
              name="rollNumber"
              id="rollNo"
              placeholder="Enter Student Roll No."
              style="width: 10rem;"
            />
          </div>
          <label for="sem">Select Semester</label
            ><select name="sem" id="sem" class="sel">
              <option value="1">Semester 1</option>
              <option value="2">Semester 2</option>
            </select>
        </div>
        <div id="marks">
            <div>
                <div id="eng">
                    <label for="engM">English</label>
                    <input
                    type="number"
                    name="engM"
                    id="engM"
                    placeholder="English"
                    />
                </div>
                <div id="maths">
                    <label for="mathsM">Mathematics</label>
                    <input
                    type="number"
                    name="mathsM"
                    id="mathsM"
                    placeholder="Mathematics"
                    />
                </div>
                <div id="sci">
                    <label for="sciM">Science</label>
                    <input
                    type="number"
                    name="sciM"
                    id="sciM"
                    placeholder="Science"
                    />
                    
            </div>
          </div>
        </div>
        <input type="submit" value="Submit" id="submitButtn" />
        <br />
        <input type="reset" value="Reset" id="reset" />
      </form>
    </div>
    <div id="output" class="contentWrapper">
      <form action="#">
        <label for="semOut">Select Semester</label>
        <select name="semOut" id="semOut" class="sel">
          <option value="1">Semester 1</option>
          <option value="2">Semester 2</option>
        </select>
      </form>
      <p id="avgp">
        Average Percentage: <span id="stdAveragePercentage"></span>
      </p>
      <form action="#">
        <label for="sub">Select Subject</label>
        <select name="sub" id="subAvgDrop" class="sel">
          <option value="English">English</option>
          <option value="Mathematics">Mathematics</option>
          <option value="Science">Science</option>
        </select>
      </form>
      <p id="avg">Average : <span id="stdAverage"></span></p>
      <p id="top2">Top two: <span id="top2Stud"></span></p>
    </div>
  </body>
  <script
    src="https://code.jquery.com/jquery-2.2.4.js"
    integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
    crossorigin="anonymous"
  ></script>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>  
  <script>
    $(document).ready(function () {
      updatePercentage(1);
      updateSubjectAverage("english");
      updateTopScorer();
    });

    $("#submitButtn").on("click", function (e) {
      submitForm(e);
     
    });

    function submitForm(e) {
      e.preventDefault();
      var data = $("#studentForm").serializeArray();
      let formData = {};

      for (let v of data) {
        formData[v.name] = v.value;
      }
      console.log(formData);
      $.ajax({
        type: "POST",
        url: "/addStudent",
        data: JSON.stringify(formData),
        success: function () {
            swal({  
                title: "Success!",  
                text: "data added succesully!",  
                icon: "success",  
                button: "next!",  
              });  
            
            updatePercentage(1);
            updateSubjectAverage("english");
            updateTopScorer();
            $("#reset").trigger('click');
        },
        dataType: "json",
        contentType: "application/json",
      });
    }

    $("#semOut").on("change", function (e) {
      let sem = $("#semOut").val();
      e.preventDefault();
      updatePercentage(sem);
    });

    $("#subAvgDrop").on("change", function (e) {
      let sem = $("#subAvgDrop").val();
      e.preventDefault();
      updateSubjectAverage(sem);
    });

    function updatePercentage(sem) {
      $.ajax({
        type: "GET",
        url: "/percentage/" + sem,
        success: function (data) {
          $("#stdAveragePercentage").html(data.percentage);
        },
        contentType: "application/json",
      });
    }
    function updateSubjectAverage(sub) {
      $.ajax({
        type: "GET",
        url: "/average/" + sub,
        success: function (data) {
          $("#stdAverage").html(data.average);
        },
        contentType: "application/json",
      });
    }
    function updateTopScorer() {
      $.ajax({
        type: "GET",
        url: "/topScorer",
        success: function (data) {
          console.log(data);
          let i = 0;
          let topVal = "";
          for (let xx in data.topTwoScorer) {
            if (i == 2) {
              break;
            }
            i++;
            topVal += data.topTwoScorer[xx] + " (" + xx + ") &nbsp";
          }
          $("#top2Stud").html(topVal);
        },
        contentType: "application/json",
      });
    }
  </script>
</html>
