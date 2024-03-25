<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CourseworkVS._Default" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            <div class="row justify-content-center">
                <div class="col-md-8 text-center">
                  <h1 class="display-3">IDEA E-LEARNING</h1>
                  <p class="lead">IDEA E-LEARNING is the best online learning platform in the country.</p>
                    <hr />
                </div>
            </div>
        </section>

        <div class="row">
            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Number of Students</h5>
                        <p class="card-text">
                            <asp:FormView ID="FormView1" runat="server" DataSourceID="Student">
                                <EditItemTemplate> TOTAL_STUDENTS: <asp:TextBox
                                        ID="TOTAL_STUDENTSTextBox" runat="server"
                                        Text='<%# Bind("TOTAL_STUDENTS") %>' />
                            <br />
                            <asp:LinkButton
                                        ID="UpdateButton" runat="server" CausesValidation="True"
                                        CommandName="Update" Text="Update" /> &nbsp;<asp:LinkButton
                                        ID="UpdateCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate> TOTAL_STUDENTS: <asp:TextBox
                                        ID="TOTAL_STUDENTSTextBox" runat="server"
                                        Text='<%# Bind("TOTAL_STUDENTS") %>' />
                            <br />
                            <asp:LinkButton
                                        ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text="Insert" /> &nbsp;<asp:LinkButton
                                        ID="InsertCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TOTAL_STUDENTSLabel" runat="server"
                                        Text='<%# Bind("STUDENTS") %>' />
                                    <br />

                                </ItemTemplate>
                            </asp:FormView>
                        </p>
                        <asp:SqlDataSource ID="Student" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                            SelectCommand="SELECT COUNT(*) AS Students FROM student">
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Number of Instructors</h5>
                        <p class="card-text">

                            <asp:FormView ID="FormView2" runat="server" DataSourceID="Instructors">
                                <EditItemTemplate> INSTRUCTORS: <asp:TextBox ID="INSTRUCTORSTextBox"
                                        runat="server" Text='<%# Bind("INSTRUCTORS") %>' />
                              <br />
                              <asp:LinkButton
                                        ID="UpdateButton" runat="server" CausesValidation="True"
                                        CommandName="Update" Text="Update" /> &nbsp;<asp:LinkButton
                                        ID="UpdateCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate> INSTRUCTORS: <asp:TextBox
                                        ID="INSTRUCTORSTextBox" runat="server"
                                        Text='<%# Bind("INSTRUCTORS") %>' />
                              <br />
                              <asp:LinkButton
                                        ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text="Insert" /> &nbsp;<asp:LinkButton
                                        ID="InsertCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="INSTRUCTORSLabel" runat="server"
                                        Text='<%# Bind("INSTRUCTORS") %>' />
                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="Instructors" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                SelectCommand="SELECT COUNT(*) AS instructors FROM instructor">
                            </asp:SqlDataSource>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Number of Courses</h5>
                        <p class="card-text">

                            <asp:FormView ID="FormView3" runat="server" DataSourceID="Course">
                                <EditItemTemplate> TOTAL_COURSE: <asp:TextBox
                                        ID="TOTAL_COURSETextBox" runat="server"
                                        Text='<%# Bind("TOTAL_COURSE") %>' />
                              <br />
                              <asp:LinkButton
                                        ID="UpdateButton" runat="server" CausesValidation="True"
                                        CommandName="Update" Text="Update" /> &nbsp;<asp:LinkButton
                                        ID="UpdateCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </EditItemTemplate>
                                <InsertItemTemplate> TOTAL_COURSE: <asp:TextBox
                                        ID="TOTAL_COURSETextBox" runat="server"
                                        Text='<%# Bind("TOTAL_COURSE") %>' />
                              <br />
                              <asp:LinkButton
                                        ID="InsertButton" runat="server" CausesValidation="True"
                                        CommandName="Insert" Text="Insert" /> &nbsp;<asp:LinkButton
                                        ID="InsertCancelButton" runat="server"
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="TOTAL_COURSELabel" runat="server"
                                        Text='<%# Bind("TOTAL_COURSE") %>' />
                                    <br />

                                </ItemTemplate>
                            </asp:FormView>
                            <asp:SqlDataSource ID="Course" runat="server"
                                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>"
                                SelectCommand="SELECT COUNT(*) AS total_course FROM course">
                            </asp:SqlDataSource>
                        </p>
                    </div>
                </div>
            </div>
        </div>
        
        <hr />

        <div class="container text-center">
          <div class="row">
            <div class="col">
                Number of Student according to the Country<br />
                <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" Width="570px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="COUNTRY" YValueMembers="STUDENT_COUNT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT 
    country,
    COUNT(*) AS student_count
FROM 
    student
GROUP BY 
    country"></asp:SqlDataSource>
            </div>

            <div class="col">
                Number of Instructors according to the Country<br />
                <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource2" Width="570px">
                    <Series>
                        <asp:Series Name="Series1" XValueMember="COUNTRY" YValueMembers="TOTAL_INSTRUCTORS">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT country, COUNT(instructor_id) AS total_instructors
FROM instructor
GROUP BY country"></asp:SqlDataSource>
            </div>
          </div>

            <div class="row mt-5">

              <div class="col">
                  Number of Enrolled Students in each Course<br />
                  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.course_title, COUNT(ec.student_id) AS enrolled_students
FROM enrolledcourse ec
JOIN course c ON ec.course_id = c.course_id
GROUP BY c.course_title"></asp:SqlDataSource>
                  <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource4" Width="570px">
                      <Series>
                          <asp:Series Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="ENROLLED_STUDENTS">
                          </asp:Series>
                      </Series>
                      <ChartAreas>
                          <asp:ChartArea Name="ChartArea1">
                          </asp:ChartArea>
                      </ChartAreas>
                  </asp:Chart>
              </div>
            </div>
        </div>
    </main>

</asp:Content>