<%@ Page Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="RezervimStatus.aspx.cs" Inherits="ProjektDotNet.RezervimStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Status i Rezervimeve
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="css/RezervimStatus.css" rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    
    <form id="form1" runat="server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" Height="298px" Width="931px" CssClass="Grid"
    OnRowCommand="Veprim">
        
        <Columns>
            <asp:BoundField DataField="RezervimID" HeaderText="RezervimID" 
                InsertVisible="False" ReadOnly="True" SortExpression="RezervimID"   />
           
            <asp:BoundField DataField="KlientID" HeaderText="KlientID"  HeaderStyle-CssClass="header"
                InsertVisible="False" ReadOnly="True" SortExpression="KlientID" />
           
           
            <asp:BoundField DataField="Emri" HeaderText="Emri" SortExpression="Emri" />
            
             <asp:BoundField DataField="Mbiemri" HeaderText="Mbiemri" HeaderStyle-CssClass="header"
                SortExpression="Mbiemri" />
           
            <asp:BoundField DataField="Date_CheckIn" HeaderText="Date_CheckIn" 
                SortExpression="Date_CheckIn" />
           
            <asp:BoundField DataField="Date_CheckOut" HeaderText="Date_CheckOut"
                SortExpression="Date_CheckOut" />
         
            <asp:BoundField DataField="Numri" HeaderText="Numri" SortExpression="Numri"  />
          
            <asp:BoundField DataField="Pagesa" HeaderText="Pagesa" HeaderStyle-CssClass="header"
                SortExpression="Pagesa" />

          <asp:ButtonField ButtonType="Button"  CommandName="Anullo" HeaderText="Veprim 1" ShowHeader="True" 
                Text="Anullo"   ControlStyle-BorderColor="#33b5e5" ControlStyle-BackColor="#33b5e5" ControlStyle-ForeColor="White" />

            <asp:ButtonField ButtonType="Button"   CommandName="CheckIn" HeaderText="Veprim 2" 
                ShowHeader="True" Text="CheckIn"  ControlStyle-BorderColor="#33b5e5" ControlStyle-BackColor="#33b5e5" ControlStyle-ForeColor="White"  />

            <asp:ButtonField ButtonType="Button"   CommandName="CheckOut" HeaderText="Veprim 3" 
                ShowHeader="True" Text="CheckOut" ControlStyle-BorderColor="#33b5e5" ControlStyle-BackColor="#33b5e5" ControlStyle-ForeColor="White" />
             

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
	    ConnectionString="<%$ ConnectionStrings:SqlConnection %>" 
	    SelectCommand="RezervimStatus" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>

</form>

</asp:Content>