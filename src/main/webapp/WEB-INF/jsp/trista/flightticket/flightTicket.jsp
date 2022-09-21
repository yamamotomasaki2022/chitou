<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>預訂機票</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="https://img.onl/DOO7l" rel="icon" type="image/png" />
<style>
fieldset {
            width: 900px;
            border: 1px solid #A8FF24;
            border-radius: 15px;
            margin: auto;
            background-color:#ECF5FF;
            
        }
legend {
            color: #FF8000;
            text-align: center;
            margin: auto;
            font-weight:bolder;
        }

.title{
			font-style:oblique;
			text-align: center;
}

img{
center;
}

</style>
</head>

<body>
<header>
   <nav class="navbar navbar-expand-md navbar-dark" style="background-color: lightblue">
        <div>
          <img src ="images/chitou.png" />
                        <a>一起去Chitou</a>
                    </div>

                    
              </nav>
 </header>
<form:form action="addFlightTicket" method="post" modelAttribute="flightTicket">
<fieldset><legend>新增航班</legend>
<div>
航班編號：<input type="text" name="flightID">
艙等：
<form:select path="classID">
<form:option  value="1">頭等艙</form:option>
<form:option  value="2">商務艙</form:option>
<form:option  value="3">經濟艙</form:option>
</form:select>
</div>
<div>
<br>
去程日期：<form:input path="departureTime"></form:input>
回程日期：<form:input path="arrivalTime"></form:input>
</div>
<div>
<br>
票價：<form:input path="fare"/>
</div>
<br>
<div>
航空公司：<form:input type="text" path="airline"/>
<br>
</div>
<div>
<br>
出發機場編號：
<form:select path="originID">
<form:option  value="台北TPE">台北</form:option>
<form:option  value="香港HKG">香港</form:option>
<form:option  value="澳門MFM">澳門</form:option>
<form:option  value="紐約NYK">紐約</form:option>
<form:option  value="東京TYO">東京</form:option>
<form:option  value="釜山PUS">釜山</form:option>
</form:select>
抵達機場編號：
<form:select path="destinationID">
<form:option  value="台北TPE">台北</form:option>
<form:option  value="香港HKG">香港</form:option>
<form:option  value="澳門MFM">澳門</form:option>
<form:option  value="紐約NYK">紐約</form:option>
<form:option  value="東京TYO">東京</form:option>
<form:option  value="釜山PUS">釜山</form:option>
</form:select>
</div>

<div class="submit">
<br>
<center>
<form:button name="submit">新增</form:button>
<form:button name="reset">清除</form:button>

</center>
</div>
</fieldset>
</form:form>





<form action="updateFlightTicket" method="post">
<fieldset><legend>修改航班</legend>
<div>
航班編號：<input type="text" name="flightID">

<br>
<div class="newfare">
<br>
更新票價：<input type="text" name="newfare">

</div>


<div class="update">
<br>
<center>

<input type="submit" name="update" value="修改">

</center>

</div>
</fieldset>
</form>





<form action="deleteFlightTicket" method="post">
<fieldset><legend>刪除航班</legend>
<div>
航班編號：<input type="text" name="flightID">



<div class="delete">

<center>

<input type="submit" name="delete" value="刪除">

</center>
</div>
</fieldset>
</form>




<form action="searchFlightTicket" method="post">
<fieldset><legend>查詢航班</legend>


從
<select name="originID">
<option  value="台北TPE">台北</option>
<option  value="香港HKG">香港</option>
<option  value="澳門MFM">澳門</option>
<option  value="紐約NYK">紐約</option>
<option  value="東京TYO">東京</option>
<option  value="釜山PUS">釜山</option>
</select>
到
<select name="destinationID">
<option  value="台北TPE">台北</option>
<option  value="香港HKG">香港</option>
<option  value="澳門MFM">澳門</option>
<option  value="紐約NYK">紐約</option>
<option  value="東京TYO">東京</option>
<option  value="釜山PUS">釜山</option>
</select>
<div>
<br>
去程日期：<input type="date" name="departureTime">
回程日期：<input type="date" name="arrivalTime">
</div>
<div>
<br>
艙等：
<select name="classID">
<option  value="1">頭等艙</option>
<option  value="2">商務艙</option>
<option  value="3">經濟艙</option>
</select>

<center>
<input type="submit" name="read" value="送出">
</center>

</form>
</body>
</html>