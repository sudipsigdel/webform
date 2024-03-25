<%@ Page Title="Best E_Course" Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master"  CodeBehind="Best.aspx.cs" Inherits="CourseworkVS.Best" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <h2>Select Month</h2>
        <asp:DropDownList CssClass ="form-control mb-3" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="dropdownbataako" DataTextField="(EXTRACT(MONTHFROMENROLL_DATE))" DataValueField="(EXTRACT(MONTHFROMENROLL_DATE))" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:SqlDataSource ID="dropdownbataako" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select DISTINCT (EXTRACT(month from enroll_date)) from enrolledcourse "></asp:SqlDataSource>
        <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" DataSourceID="query" Width="431px">
        </asp:GridView>
        <asp:SqlDataSource ID="query" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT d.course_id Course_Id ,d.a Admission, c.course_title Title 
FROM (SELECT course_id, count(student_id) as a 
FROM enrolledcourse WHERE EXTRACT(month from enroll_date) = :id 
GROUP BY course_id ORDER BY count(student_id) DESC) d 
INNER JOIN course c ON d.course_id = c.course_id WHERE rownum &lt;=3">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>

