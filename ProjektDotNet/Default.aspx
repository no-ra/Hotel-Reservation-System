<%@ Page Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjektDotNet.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <form id="form1" runat="server">
        <div>
            Username <asp:TextBox ID="Username" runat="server"></asp:TextBox><br/> <br/>
        </div>
        <div>
            Password <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox><br/><br/>
        </div>
        <asp:Button ID="LoginButton" runat="server" Text="Login" onClick="CheckLogin"/>

          <asp:Label ID="LoginStatus" runat="server"></asp:Label>

    </form>
</asp:Content>
