<%@ Page Title="Student Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Student.aspx.cs" Inherits="CourseworkVS.Student" EnableEventValidation="false"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
        
            <InsertItemTemplate>
                <label CssClass="form-label"> Student Id </label>
                <asp:TextBox CssClass="form-control" ID="STUDENT_IDTextBox" runat="server" Text='<%# Bind("STUDENT_ID") %>' />

                <br />
                
                <label CssClass="form-label"> Student Name </label>
                <asp:TextBox CssClass="form-control" ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />

                <br />

                <label CssClass="form-label"> Contact </label>
                <asp:TextBox CssClass="form-control" ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />

                <br />

                <label CssClass="form-label"> Date of Birth </label>
                <asp:TextBox CssClass="form-control" ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />

                <br />
                
                <label CssClass="form-label"> Email Address </label>
                <asp:TextBox CssClass="form-control" ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />

                <br />

                <label CssClass="form-label"> Country </label>
                <asp:TextBox CssClass="form-control" ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />

                <div class="d-grid gap-2 d-md-block mt-3 mb-3">
                        <asp:LinkButton CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        <asp:LinkButton CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                </div>
            </InsertItemTemplate>

            <ItemTemplate>
                <asp:LinkButton CssClass="btn btn-success mb-3" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Add new Student" />
            </ItemTemplate>
        </asp:FormView>

        <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID" />
                <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT_NAME" SortExpression="STUDENT_NAME" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :DOB, :EMAIL_ADDRESS, :COUNTRY)" OnSelecting="SqlDataSource1_Selecting" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT student_id, student_name, contact, to_char(dob, 'yyyy-MON-dd') dob, email_address, country from student" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</asp:Content>
