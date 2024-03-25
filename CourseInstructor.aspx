<%@ Page Title="Course Instructor" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="CourseInstructor.aspx.cs" Inherits="CourseworkVS.CourseInstructor" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <h2>Select Instructor</h2>

        <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="dd" DataTextField="INSTRUCTOR_NAME" DataValueField="INSTRUCTOR_ID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dd" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot; FROM &quot;INSTRUCTOR&quot;"></asp:SqlDataSource>

        <asp:GridView CssClass="table table-striped mt-3" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select i.instructor_name, c.course_title from instructor i, course c, courseinstructor ci
            where i.instructor_id = ci.instructor_id
            and ci.course_id = c.course_id
            and i.instructor_id IN (SELECT instructor_id FROM courseinstructor GROUP BY instructor_id HAVING count(course_id) &gt; 1) 
            and i.instructor_id = :id">

            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

