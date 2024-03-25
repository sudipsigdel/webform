<%@ Page Title="Course Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Course.aspx.cs" Inherits="CourseworkVS.Course" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
            
            <InsertItemTemplate>
                <label CssClass="form-label"> Course Id </label>
                <asp:TextBox CssClass="form-control" ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                
                <br />

                <label CssClass="form-label"> Course Title </label>
                <asp:TextBox CssClass="form-control" ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' />

                <div class="d-grid gap-2 d-md-block mt-3 mb-3">
                    <asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    <asp:LinkButton CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                </div>
            </InsertItemTemplate>
            
            <ItemTemplate>
                <asp:LinkButton CssClass="btn btn-success mb-3" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add new Course" />
            </ItemTemplate>
        </asp:FormView>

         <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
             <Columns>
                 <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                 <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE_TITLE" SortExpression="COURSE_TITLE" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;) VALUES (:COURSE_ID, :COURSE_TITLE)" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="Decimal" />
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>  
    </form>
</asp:Content>
