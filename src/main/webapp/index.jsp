<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Students Reporting System</title>
    
  </head>
  <body>
    <div id="addStudents">
      <form id="studentForm">
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
            />
          </div>
        </div>
        <div id="marks">
          <label for="sem">Select Semester</label
          ><select name="sem" id="sem">
            <option value="1">Semester 1</option>
            <option value="2">Semester 2</option>
          </select>
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
        <input type="reset" value="Reset" />
      </form>
    </div>
    <div id="output">
      <form action="#">
        <label for="semOut"></label>
        <select name="semOut" id="semOut">
          <option value="1">Semester 1</option>
          <option value="2">Semester 2</option>
        </select>
      </form>
      <p id="avgp">
        Average Percentage: <span id="stdAveragePercentage"></span>
      </p>
      <form action="#">
        <label for="sub">Select Subject</label>
        <select name="sub" id="subAvgDrop">
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
        success: function () {},
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
