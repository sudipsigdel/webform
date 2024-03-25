<%@ Page Title="Instructor Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Instructor.aspx.cs" Inherits="CourseworkVS.Instructor" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            
            <InsertItemTemplate>
                INSTRUCTOR_ID:
                <asp:TextBox CssClass="form-control" ID="INSTRUCTOR_IDTextBox" runat="server" Text='<%# Bind("INSTRUCTOR_ID") %>' />
                
                <br />
                
                INSTRUCTOR_NAME:
                <asp:TextBox CssClass="form-control" ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' />
                
                <br />
                
                CONTACT:
                <asp:TextBox CssClass="form-control" ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                
                <br />
                
                DOB:
                <asp:TextBox CssClass="form-control" ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                
                <br />
                
                EMAIL_ADDRESS:
                <asp:TextBox CssClass="form-control" ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                
                <br />
                
                COUNTRY:
                <asp:TextBox CssClass="form-control" ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                
                <div class="d-grid gap-2 d-md-block mt-3 mb-3">
                    <asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    <asp:LinkButton CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                </div>
            </InsertItemTemplate>

            <ItemTemplate>
                <asp:LinkButton CssClass="btn btn-success mb-3" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add new Instructor" />
            </ItemTemplate>
        </asp:FormView>

        <div>
            <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="INSTRUCTOR_ID" HeaderText="INSTRUCTOR_ID" ReadOnly="True" SortExpression="INSTRUCTOR_ID" />
                    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR_NAME" SortExpression="INSTRUCTOR_NAME" />
                    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" />
                    <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                    <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL_ADDRESS" SortExpression="EMAIL_ADDRESS" />
                    <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" />
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:INSTRUCTOR_ID, :INSTRUCTOR_NAME, :CONTACT, :DOB, :EMAIL_ADDRESS, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT instructor_id, instructor_name, contact, to_char(dob, 'yyyy-MON-dd') dob, email_address, country from instructor" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;INSTRUCTOR_ID&quot; = :INSTRUCTOR_ID">
                <DeleteParameters>
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal" />
                    <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                    <asp:Parameter Name="CONTACT" Type="String" />
                    <asp:Parameter Name="DOB" Type="DateTime" />
                    <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                    <asp:Parameter Name="COUNTRY" Type="String" />
                    <asp:Parameter Name="INSTRUCTOR_ID" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</asp:Content>