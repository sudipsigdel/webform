<%@ Page Title="Progress Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Progress.aspx.cs" Inherits="CourseworkVS.Progress" EnableEventValidation="false"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_NO,STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
                <InsertItemTemplate>
                    STUDENT
                    <asp:DropDownList CssClass="form-control" ID="DropDownList8" runat="server" DataSourceID="std" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="std" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NAME&quot;, &quot;STUDENT_ID&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                    <br />
                    COURSE
                    <asp:DropDownList CssClass="form-control" ID="DropDownList9" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    <br />
                    LESSON
                    <asp:DropDownList CssClass="form-control" ID="DropDownList7" runat="server" DataSourceID="lsn" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="lsn" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                    <br />
                    LESSON_STATUS:
                    <asp:TextBox CssClass="form-control" ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                    <br />
                    LAST_ACCESSED_DATE:
                    <asp:TextBox CssClass="form-control" ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                    
                    <div class="d-grid gap-2 d-md-block mt-3 mb-3">
                        <asp:LinkButton  CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        <asp:LinkButton  CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    </div>
                </InsertItemTemplate>

                <ItemTemplate>
                    <asp:LinkButton  CssClass="btn btn-success mb-3" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add new Student Progress" />
                </ItemTemplate>
            </asp:FormView>

            <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_NO,STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                   <%-- 
                    <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    --%>
                    <asp:TemplateField HeaderText="Student">
                        <ItemTemplate>
                            <asp:DropDownList CssClass="form-control"  Enabled="false" ID="DropDownList4" runat="server" DataSourceID="student" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="student" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:DropDownList CssClass="form-control"  Enabled="false" ID="DropDownList5" runat="server" DataSourceID="course" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="course" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Lesson">
                        <ItemTemplate>
                            <asp:DropDownList CssClass="form-control"  Enabled="false" ID="DropDownList6" runat="server" DataSourceID="lesson" DataTextField="LESSON_TITLE" DataValueField="LESSON_NO" SelectedValue='<%# Bind("LESSON_NO") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="lesson" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS" />

                    <asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE" />
                     
                    <asp:TemplateField>
                         <ItemTemplate>
                             <asp:LinkButton ID="EditButton" runat="server" CommandName="Edit" Text="Edit"
                                 CssClass="btn btn-primary m-1" />
                             <asp:LinkButton ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete"
                                 CssClass="btn btn-danger m-1" />
                         </ItemTemplate>

                         <EditItemTemplate>
                             <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update"
                                 CausesValidation="True" CssClass="btn btn-success m-1" />
                             <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel"
                                 CausesValidation="False" CssClass="btn btn-secondary m-1" />
                         </EditItemTemplate>
                     </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENTLESSON&quot; WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;STUDENTLESSON&quot; (&quot;LESSON_NO&quot;, &quot;STUDENT_ID&quot;, &quot;COURSE_ID&quot;, &quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;) VALUES (:LESSON_NO, :STUDENT_ID, :COURSE_ID, :LESSON_STATUS, :LAST_ACCESSED_DATE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT student_id, course_id, lesson_no, lesson_status, to_char(last_accessed_date , 'yyyy-MON-dd') last_accessed_date from studentlesson" UpdateCommand="UPDATE &quot;STUDENTLESSON&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE WHERE &quot;LESSON_NO&quot; = :LESSON_NO AND &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;COURSE_ID&quot; = :COURSE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                    <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>