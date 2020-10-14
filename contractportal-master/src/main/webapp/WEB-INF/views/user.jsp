<%@page import="com.sspl.entity.Role"%>
<%@page import="com.sspl.entity.UsersEntity"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
       <%--  <jsp:include page="menu.jsp"></jsp:include> --%>
    </head>
  
      <body>
           <form:form name="User" modelAttribute="usersEntity">
            <div class="middlecontent" > 
                 <div  class="leftbox">
                    <div class="homeleftboxbg" >
                     <div class="box1_con_blue"> <br/>
                 
                        <input class="press" type="button" value="<spring:message code="label.new"/>" onclick="submitForm('User', '/tatasky/viewUser');"/>
                        <input class="press" type="button"  id="update"onclick="submitForm('User', '/tatasky/editUserActive/${usersEntity.id}');"  value="<spring:message code="label.update"/>"/>
                        <input class="press" type="button"  id="update"onclick="submitForm('User', '/tatasky/addUser/${usersEntity.id}');"  value="<spring:message code="label.save"/>"/>
                       
 
                        </div>
                    </div>
                </div>
            
            
             <div class="middlebox" >
                 
                  <font style="font-size: 20px">Enter User Details</font>
                 <div class="messagebar">
                     <span id="messagebar" style="color:red"></span>
                       </div>
                 
                
                 <br>
                <div>
                     <fieldset class="fieldset">
                     <legend>User List</legend>
                     <div class="field_sel_rec">
                     <table  class="sel_rec" >
                                           
                     <tr>
                      <th>User Name</th>
                       <th>First Name</th>
                       <th>Last Name</th>
                       <th>Email</th>
                        <th>Mobile No.</th>
                        <th>Role</th>
                       </tr> 
                                                                     
                     
               <c:if  test="${!empty userList}">	
				<c:forEach items="${userList}" var="usersEntity">
						<tr>
						
						<td><a href="/tatasky/editUser/${usersEntity.id}"> ${usersEntity.username} </a></td>
					
						<td>${usersEntity.fName}</td>
						<td>${usersEntity.lName}</td>
						<td>${usersEntity.emailId}</td>
						<td>${usersEntity.mobileNo}</td>
						<td>${usersEntity.roleObj.role}</td>
						</tr>
                                    
                        </c:forEach>
</c:if>		
           
                
                       
                         </table>
                         
  </div>
                
                     </fieldset>
                     </div>
                     <br>
                     
                     <fieldset class="fieldset" >
                         <legend>User Master</legend>
                         <div class="inputdiv">
                         <table class="bank"> 
                           
                             <tr>
                                                   
                                 <td><form:label path="fName"><spring:message code="label.fname"/></form:label></td> 
                                 <td ><form:input path="fName" style="width: 116px" validate="First Name,string,yes"   /></td>
                                
                                 <td><form:label path="mName"><spring:message code="label.mname"/></form:label></td>
                                 <td><form:input path="mName" style="width: 116px"/></td>
                                
                                 <td><form:label path="lName"><spring:message code="label.lname"/></form:label></td>
                                 <td><form:input path="lName" style="width: 116px"  validate="Last Name,string,yes"  /></td>
                               </tr>
                           
                             
                             <tr>
                                 <td><form:label path="dName"><spring:message code="label.dname"/></form:label></td>
                                 <td><form:input path="dName" style="width: 116px"  validate="Display Name,string,yes"  /></td>
                                 
                                 <td><form:label path="username"><spring:message code="label.username"/></form:label></td>
                                 <td><form:input path="username" style="width: 116px" validate="User Name,string,yes"  /></td>
                                 
                             </tr>
                           
                             <tr>
                                 <td><form:label path="employeeId"><spring:message code="label.employeeid"/></form:label></td>


                                 <td>    <select name="employeeId" style="width:122px;" validate="Employee,string,yes">
                                         <option value="">---Select---</option>
                                        <c:if test="${!empty employeList}">
                                        <c:forEach items="${employeList}" var="employee">
                                        <option value="${employee.id}">${employee.employeeName}</option>
                                        </c:forEach>
                                        </c:if>
                                     </select>
                                 </td>

                                
                                 <td><form:label path="mobileNo"><spring:message code="label.mobileno"/></form:label></td>
                                 <td><form:input path="mobileNo" style="width: 116px"  validate="Mobile,int,yes"   /></td>
                                 
                                 <td><form:label path="emailId"><spring:message code="label.emailid"/></form:label></td>
                                 <td><form:input path="emailId" style="width: 116px"  validate="Email ,email,yes" /></td>
                             </tr>
                             <tr>
                                 <td><form:label path=""><spring:message code="label.role"/></form:label></td>
                                 <td>    <select name="roleId" style="width:122px;" validate="Role,string,yes">
                                         <option value="">---Select---</option>
                                        <c:if test="${!empty roleList}">
                                        <c:forEach items="${roleList}" var="roleId">
                                        <option value="${roleId.id}">${roleId.role}</option>
                                        </c:forEach>
                                        </c:if>
                                     </select>
                                 </td>
                                 <td><form:label path="enabled"><spring:message code="label.active"/></form:label></td>
                                 <td><form:checkbox path="enabled" value="1"/></td>
                                     

                             </tr>
                         </table>               
           </div>
                      
                     </fieldset>
                     
                 </div>
        </div></form:form>
 
    </body>
</html>
