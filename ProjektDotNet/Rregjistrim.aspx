<%@ Page Title="" Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="Rregjistrim.aspx.cs" Inherits="ProjektDotNet.Rregjistrim" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
Rregjistrim
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
     <link href="css/Rregjistrim.css" rel="stylesheet" type="text/css" />
</asp:Content>



<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
<div class="container">
    <form id="form1" runat="server"> 
        
        <div class="row">
                <span class="col-xs-2">Emri</span>
                <asp:TextBox ID="Emri" runat="server" class="col-xs-2"></asp:TextBox>

            <asp:RequiredFieldValidator id="emriReq"
                runat="server" ForeColor="Black"
                ControlToValidate="Emri"
                ErrorMessage="Emri eshte i detyrueshem!"
                SetFocusOnError="True" 
                class="col-xs-4"/>  

      </div>
      <div class="row">     
            <span class="col-xs-2">Mbiemri</span>
            <asp:TextBox ID="Mbiemri"  runat="server" class="col-xs-2"></asp:TextBox>

            <asp:RequiredFieldValidator id="mbiemriReq"
                      runat="server"  ForeColor="Black"
                      ControlToValidate="Mbiemri"
                      ErrorMessage="Mbiemri eshte i detyrueshem!"
                      SetFocusOnError="True" 
                      class="col-xs-4"/> 
       </div>
       
       <div class="row">
             <span class="col-xs-2">Username </span> 
             <asp:TextBox ID="Username" runat="server" class="col-xs-2"></asp:TextBox>
    
             <asp:RequiredFieldValidator id="usernameReq"
                      runat="server"   ForeColor="Black"
                      ControlToValidate="Username"
                      ErrorMessage="Username eshte i detyrueshem!" 
                      SetFocusOnError="True" 
                      class="col-xs-4"/> 
      </div>

      <div class="row">
           <span class="col-xs-2">Password</span>
           <asp:TextBox ID="Password" runat="server" TextMode="Password"  class="col-xs-2"></asp:TextBox>

            <asp:RequiredFieldValidator id="passwordReq"
                runat="server"  ForeColor="Black" 
                ControlToValidate="Password"
                ErrorMessage="Password-i eshte i detyrueshem" 
                SetFocusOnError="True"
                class="col-xs-4"/> 
      </div>

      <div class="row">
          <span class="col-xs-2">Confirm Password</span>
          <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" class="col-xs-2"></asp:TextBox>
              
          <asp:RequiredFieldValidator id="confirmPasswordReq"
            runat="server"  ForeColor="Black" 
            ControlToValidate="ConfirmPassword"
            ErrorMessage="Konfirmimi i password-it eshte i detyrueshem!"
            SetFocusOnError="True"
            class="col-xs-4"/> 

          <asp:CompareValidator id="comparePasswords" 
            runat="server" ForeColor="Black"
            ControlToCompare="Password"
            ControlToValidate="ConfirmPassword"
            ErrorMessage="Password-et nuk jane te njejte!"
            class="col-xs-4"/>   
        
      </div>
   
      <div class="row">
      
          <div class="col-xs-1">
               <span>Admin</span>
               <asp:RadioButton ID="RadioButton1" GroupName="Privilegj"  runat="server" Checked="True"/>
          </div>
          <div class="col-xs-1">
               <span>User</span>
               <asp:RadioButton ID="RadioButton2" GroupName="Privilegj" runat="server"/>
          </div>
      </div>
    
      <div class="row">
        <asp:Button ID="Rregjistro" runat="server" Text="Rregjistro" OnClick="Btn_Rregjistro" CssClass="button col-md-1 btn-info"/> 
        <asp:Button ID="Reset" runat="server" Text="Reset" OnClick="Btn_Reset" CssClass="button col-md-1 btn-danger" CausesValidation="false"/>
     </div>


     <div class="row">
        <asp:Label ID="RegjistrimStatus" runat="server"></asp:Label> 
     </div>

    <div class="container"> 
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="MenaxherID" DataSourceID="SqlDataSource1" 
        OnRowCommand="Veprim" CssClass="Grid" Height="142px" Width="514px">
            
        <Columns>
           
            <asp:BoundField DataField="MenaxherID" HeaderText="MenaxherID"
                InsertVisible="False" ReadOnly="True" SortExpression="MenaxherID"/>    

            <asp:BoundField DataField="Emer" HeaderText="Emer" SortExpression="Emer" />
            
            <asp:BoundField DataField="Mbiemer" HeaderText="Mbiemer" 
                SortExpression="Mbiemer" />
            
            <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
           
            <asp:CheckBoxField DataField="Admin" HeaderText="Admin" 
                SortExpression="Admin" /> 
           
           
            <asp:ButtonField ButtonType="Button"
                CommandName="Fshi" HeaderText="Veprim" 
                ShowHeader="True" Text="Fshi"   
                ControlStyle-BorderColor="#33b5e5" 
                ControlStyle-BackColor="#33b5e5" 
                ControlStyle-ForeColor="White" /> 
                  
       </Columns>
    </asp:GridView>  
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:SqlConnection %>" 
        SelectCommand="MenaxherRregjistrim" 
        SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
   </form>
</div>
</asp:Content>
