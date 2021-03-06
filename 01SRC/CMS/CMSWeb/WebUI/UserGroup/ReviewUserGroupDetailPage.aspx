﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master"  CodeFile="ReviewUserGroupDetailPage.aspx.cs"  Title="用户组详情" Inherits="ReviewUserGroupDetailPage" %>
<%@ Register Assembly="DateTextBox" Namespace="Titan.WebForm" TagPrefix="TW" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
<%--    <script language="javascript" type="text/javascript" src="../../Scripts/jquery-1.4.1.js"></script>
<script language="javascript" type="text/javascript" src="../../Scripts/jquery-1.4.1.min.js"></script>--%>
<script language="javascript" type="text/javascript">
    function ClearClickEvent() {

    }

    function PopupArea(arg) {
        var fulls = "left=0,screenX=0,top=0,screenY=0,scrollbars=1";    //定义弹出窗口的参数
        if (window.screen) {
            var ah = screen.availHeight - 30;
            var aw = screen.availWidth - 10;
            fulls += ",height=" + ah;
            fulls += ",innerHeight=" + ah;
            fulls += ",width=" + aw;
            fulls += ",innerWidth=" + aw;
            fulls += ",resizable"
        } else {
            fulls += ",resizable"; // 对于不支持screen属性的浏览器，可以手工进行最大化。 manually
        }
        var time = new Date();
        var retunValue = window.open("UserGroupDetailPage.aspx?ID=" + arg + "&time=" + time, null, fulls);
        //window.location.href = "UserDetailPage.aspx?ID=" + arg + "&time=" + time;
    }
</script>
  <div id="right">
    <div class="frame01">
      <ul>
        <li class="title">用户组明细</li>
        <li>用户组名：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbUserGroupNM" runat="server" Text="UserGroupNM" />
        </li>
        <li>
            注册渠道：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbRegChannelList" runat="server" Text="lbRegChannelList" />
        </li>  
        <li>
            注册平台：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbPlatformList" runat="server" Text="lbPlatformList" />
        </li>
        <li>注册时间：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbRegistDTime" runat="server" Text="lbRegistDTime" />
        </li>
         <li>最后登录时间：
            <asp:Label ID="lbLoginDTime" runat="server" Text="lbLoginDTime" />
        </li>
        <li>最近订单时间：
            <asp:Label ID="lbLastOrder" runat="server" Text="lbLastOrder" />
        </li>
        <li>提交订单：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbSubmitOrder" runat="server" Text="lbSubmitOrder" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            成功订单：&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbCompleteOrder" runat="server" Text="lbCompleteOrder" />
        </li>
        <li>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" valign="top">
                        手动添加：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共<asp:Label ID="lbManualCount" runat="server" Text="lbManualAdd" />名
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="txtManualAdd" runat="server" TextMode="MultiLine" Width="500px" Height="200px" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </li>
        <li>共包括用户：&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lbUserCount" runat="server" Text="lbUserCount" />名
        </li>
        <li>
            <asp:Button ID="btnExport" runat="server" CssClass="btn primary" Text="导出Excel"  onclick="btnExport_Click"/> 
            <%--<input id="btnBack" style="width:80px;height:20px" type="button" value="返回" onclick="javascript:window.location.href='ReviewUserGroupPage.aspx'" />--%>
        </li>
        <li><div id="detailMessageContent" runat="server" style="color:red"></div></li>
      </ul>
    </div>
    <div class="frame02">
        <div id="result"></div>
        <asp:GridView ID="gridViewCSUserGroupListDetail" runat="server" AutoGenerateColumns="False" BackColor="White" AllowPaging="True" 
                            CellPadding="4" CellSpacing="1" 
                            Width="100%" EmptyDataText="没有数据" DataKeyNames="ID" 
                            onrowdatabound="gridViewCSUserGroupListDetail_RowDataBound"  OnRowEditing="gridViewCSUserGroupListDetail_RowEditing"
                            OnRowUpdating="gridViewCSUserGroupListDetail_RowUpdating" OnRowCancelingEdit="gridViewCSUserGroupListDetail_RowCancelingEdit" 
                            onpageindexchanging="gridViewCSUserGroupListDetail_PageIndexChanging" PageSize="20"  CssClass="GView_BodyCSS">
                <Columns>
<%--                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="手机号码">
                        <ItemTemplate>
                           <a href="#" onclick="PopupArea('<%# DataBinder.Eval(Container.DataItem, "USERID") %>')"><%# DataBinder.Eval(Container.DataItem, "LOGINMOBILE")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <asp:HyperLinkField HeaderText="手机号码" DataNavigateUrlFields="USERID" DataNavigateUrlFormatString="UserDetailPage.aspx?ID={0}" 
                    Target="_blank" DataTextField="LOGINMOBILE"><ItemStyle HorizontalAlign="Center" /></asp:HyperLinkField>

                    <asp:BoundField DataField="LOGINMOBILE" HeaderText="手机号码" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="CREATETIME" HeaderText="注册日期" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="REGCHANELNM" HeaderText="注册渠道" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="PLATFORMNM" HeaderText="注册平台" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="SIGN_KEY" HeaderText="登录验证码" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="SIGNTIME" HeaderText="上次登录时间" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="ALLCOUNT" HeaderText="总订单数" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                    <asp:BoundField DataField="COMPLECOUNT" HeaderText="成功订单数" ReadOnly="True"><ItemStyle HorizontalAlign="Center" /></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#C6C3C6" ForeColor="Black"/>
                <PagerStyle HorizontalAlign="Right" />
                <RowStyle CssClass="GView_ItemCSS" />
                <HeaderStyle CssClass="GView_HeaderCSS" />
                <AlternatingRowStyle CssClass="GView_AlternatingItemCSS"  />
            </asp:GridView>
    </div>
</div>
<asp:HiddenField ID="hidUserGroupID" runat="server"/>
</asp:Content>