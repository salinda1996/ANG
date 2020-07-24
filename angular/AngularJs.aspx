<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="AngularJs.aspx.vb" Inherits="angular.AngularJs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Angular JS Table</title>
      <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
      <script src="scripts/app/ang.js"></script>
      <style>
         table, th , td {
            border: 1px solid grey;
            border-collapse: collapse;
            padding: 5px;
         }

         table tr:nth-child(odd) {
            background-color: #f2f2f2;
         }

         table tr:nth-child(even) {
            background-color: #ffffff;
         }
      </style>
   </head>
   
   <body ng-app="myModule">
       <form id="form1" runat="server">
      <h2>AngularJS Sample Application</h2>
      <div ng-controller = "myController" >
        <input type="checkbox" ng-model="hide" /> City
           <input type="checkbox" ng-model="hide1" /> City
        <select ng-model="getval">
            <option ng-repeat="employee in employees">{{employee.city}}</option>
        </select>
       
          <table>
              <thead>
                  <tr>
                      <th>Name</th>
                      <th>Age</th>
                      <th ng-hide="">City</th>
                  </tr>
              </thead>
              <tbody>
                  <tr ng-repeat="employee in employees">
                      <td >{{employee.name}}</td>
                      <td>{{employee.age}}</td>
                      <td ng-hide="">{{employee.city}}</td>
                  </tr>
              </tbody>
          </table>
        
                <div class="form-group row" ng-if="getval == 'London1'">
                    <label for="A3 Photocopy Papers" class="col-sm-2 col-form-label">A3 Photocopy Papers</label>
                    <div class="col-sm-10">
        
                        <asp:TextBox ID="A3_photocopy_papers" runat="server" class="form-control" style="width:1000px;" TextMode="Number"></asp:TextBox>
                    </div>
                </div>

               <div class="form-group row" ng-if="getval == 'London2'">
                    <label for="A4 Photocopy Papers" class="col-sm-2 col-form-label">A4 Photocopy Papers</label>
                    <div class="col-sm-10">
       
                        <asp:TextBox ID="A4_photocopy_papers" runat="server" class="form-control" style="width:1000px;" TextMode="Number"></asp:TextBox>
                    </div>
                   <asp:Button ID="Button1" runat="server" Text="Button" />

              </div> <br />

          <!-- data source0-->
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="item_id1" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="item_id" HeaderText="item_id" SortExpression="item_id" />
                            <asp:BoundField DataField="result" HeaderText="result" ReadOnly="True" SortExpression="result" />
                            <asp:BoundField DataField="item_id1" HeaderText="item_id1" ReadOnly="True" SortExpression="item_id1" />
                            <asp:BoundField DataField="item_name" HeaderText="item_name" SortExpression="item_name" />
                            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                            <asp:BoundField DataField="type" HeaderText="type" SortExpression="type" />
                        </Columns>
                              </asp:GridView>


                              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pressConnectionString %>" SelectCommand="select *from (select t1.item_id,(t1.TotalIn-t2.TotalOut) as result from (select item_id,sum(quantity)TotalIn from Quantity where status='in' group by item_id) t1
                    inner join  (select item_id,sum(quantity)TotalOut from Quantity where status='out' group by item_id ) t2 on t1.item_id=t2.item_id) t3 inner join Item on t3.item_id = Item.item_id
                    "></asp:SqlDataSource>


      </div>



       </form>
   </body>
</html>