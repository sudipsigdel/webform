<%@ Page Title="Student Enrollment" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="StudentEnrollment.aspx.cs" Inherits="CourseworkVS.StudentEnrollment" EnableEventValidation="false"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <div>
            <h2>Select Student</h2>
            <asp:DropDownList CssClass="form-control mb-3" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="dd" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID">
            </asp:DropDownList>

            <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,COURSE_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                    <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
                    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT s.*, c.* from student s, course c, enrolledcourse e WHERE s.student_id = e.student_id AND e.course_id = c.course_id AND s.student_id = :id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:SqlDataSource ID="dd" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
        </div>
    </form>
</asp:Content>
