<%@ Page Title="Lesson Details" Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Lesson.aspx.cs" Inherits="CourseworkVS.Lesson" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <form id="form1">
        <div>
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_NO" DataSourceID="lessongrid">
                <InsertItemTemplate>
                    LESSON_NO:
                    <asp:TextBox CssClass="form-control" ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' />
                    <br />
                    LESSON:
                    <asp:TextBox CssClass="form-control" ID="LESSONTextBox" runat="server" Text='<%# Bind("LESSON") %>' />
                    <br />
                    LESSON_TITLE:
                    <asp:TextBox CssClass="form-control"  ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
                    
                    <div class="d-grid gap-2 d-md-block mt-3 mb-3">
                        <asp:LinkButton  CssClass="btn btn-danger" ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        <asp:LinkButton  CssClass="btn btn-primary" ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    </div>
                  </InsertItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-success mb-3" ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>

            <asp:GridView CssClass="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LESSON_NO" DataSourceID="lessongrid" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" ReadOnly="True" SortExpression="LESSON_NO" />
                    <asp:BoundField DataField="LESSON" HeaderText="LESSON" SortExpression="LESSON" />
                    <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" />
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

            <asp:SqlDataSource ID="lessongrid" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_NO&quot; = :LESSON_NO" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_NO&quot;, &quot;LESSON&quot;, &quot;LESSON_TITLE&quot;) VALUES (:LESSON_NO, :LESSON, :LESSON_TITLE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON&quot; = :LESSON, &quot;LESSON_TITLE&quot; = :LESSON_TITLE WHERE &quot;LESSON_NO&quot; = :LESSON_NO">
                <DeleteParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                    <asp:Parameter Name="LESSON" Type="Decimal" />
                    <asp:Parameter Name="LESSON_TITLE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LESSON" Type="Decimal" />
                    <asp:Parameter Name="LESSON_TITLE" Type="String" />
                    <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>

</asp:Content>