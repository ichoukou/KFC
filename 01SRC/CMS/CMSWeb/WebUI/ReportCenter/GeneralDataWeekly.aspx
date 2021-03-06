﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master"  CodeFile="GeneralDataWeekly.aspx.cs"  Title="一周数据查询" Inherits="GeneralDataWeekly" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
<link rel="Stylesheet" href="../../Styles/jquery.autocomplete.css" />
<style type="text/css" >
.pcbackground { 
display: block; 
width: 100%; 
height: 100%; 
opacity: 0.4; 
filter: alpha(opacity=40); 
background:while; 
position: absolute; 
top: 0; 
left: 0; 
z-index: 2000; 
} 
.pcprogressBar { 
border: solid 2px #3A599C; 
background: white url("/images/progressBar_m.gif") no-repeat 10px 10px; 
display: block; 
width: 148px; 
height: 28px; 
position: fixed; 
top: 50%; 
left: 50%; 
margin-left: -74px; 
margin-top: -14px; 
padding: 10px 10px 10px 50px; 
text-align: left; 
line-height: 27px; 
font-weight: bold; 
position: absolute; 
z-index: 2001; 
}
.dvGridScroll
{
scrollbar-face-color: #FF0000; 
scrollbar-shadow-color: #FF0000;
scrollbar-highlight-color: #FFBABA; 
scrollbar-3dlight-color: #000000;
scrollbar-darkshadow-color: #000000; 
scrollbar-track-color: #8C8C8C;
scrollbar-arrow-color: #FFFFFF;
}
</style>
<script language="javascript" type="text/javascript" src="../../Scripts/jquery.autocomplete.js"></script>
<script language="javascript" type="text/javascript">
    function ClearClickEvent() {
        document.getElementById("<%=dpCreateStart.ClientID%>").value = "";
        document.getElementById("<%=dpCreateEnd.ClientID%>").value = "";
    }

    function BtnLoadStyle() { 
        var ajaxbg = $("#background,#progressBar");
        ajaxbg.hide();
        ajaxbg.show();
    }

    function BtnCompleteStyle() {
        var ajaxbg = $("#background,#progressBar");
        ajaxbg.hide();
    }
</script>
<asp:ScriptManager ID="ScriptManager1" AsyncPostBackTimeOut="36000" runat="server" ></asp:ScriptManager>
  <div id="right">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server" ChildrenAsTriggers="false">
                 <ContentTemplate>
    <div class="frame01">
      <ul>
        <li class="title">查看周数据</li>
        <li>
            <table>
                <tr style="display:none">
                     <td align="right">
                        下单时间：
                    </td>
                    <td>
                        <input id="dpCreateStart" class="Wdate" type="text" onfocus ="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'MainContent_dpCreateEnd\')||\'2020-10-01\'}'})" runat="server"/> 
                        <input id="dpCreateEnd" class="Wdate" type="text" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'MainContent_dpCreateStart\')}',maxDate:'2020-10-01'})" runat="server"/>
                    </td>
                </tr>
                 <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" CssClass="btn primary" Text="搜索" OnClientClick="BtnLoadStyle();" onclick="btnSearch_Click" />
                        <input type="button" id="btnClear" class="btn" style="display:none" value="重置"  onclick="ClearClickEvent();" />
                        <asp:Button ID="btnExport" runat="server" CssClass="btn primary" Text="导出Excel"  onclick="btnExport_Click"/>
                    </td>
                </tr>
            </table>
        </li>
        <li><div id="messageContent" runat="server" style="color:red"></div></li>
      </ul>
    </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btnExport" />
    </Triggers>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Always" runat="server" >
                <ContentTemplate>
        <div class="frame02">
                    <asp:Panel ID="Panel1" runat="server" Height="500px" ScrollBars="Auto" Width="1215px">
                    <asp:GridView ID="gridViewCSReviewList" runat="server" AutoGenerateColumns="False" BackColor="White" 
                    CellPadding="4" CellSpacing="1" Width="2400px" EmptyDataText="没有数据" DataKeyNames="Week" 
                    CssClass="GView_BodyCSS">
                    <Columns>
                         <asp:BoundField DataField="Week" HeaderText="Week" ><ItemStyle HorizontalAlign="Center" Width="4%"/></asp:BoundField>
                         <asp:BoundField DataField="新签酒店数" HeaderText="新签酒店数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <%--<asp:BoundField DataField="DONHT" HeaderText="日平均上线酒店数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>--%>
                         <asp:BoundField DataField="新用户数" HeaderText="新用户数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="IOS新用户" HeaderText="IOS新用户" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="AND新用户" HeaderText="AND新用户" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="WP新用户" HeaderText="WP新用户" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="登录用户数" HeaderText="登录用户数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="IOS用户" HeaderText="IOS用户" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="AND用户" HeaderText="AND用户" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="总订单数" HeaderText="总订单数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="成功订单数" HeaderText="成功订单数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="转化率" HeaderText="转化率" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="成功单%" HeaderText="成功单%" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="成功订单客单价" HeaderText="成功订单客单价" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="LM成功订单" HeaderText="LM成功订单" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="LM客单价" HeaderText="LM客单价" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="常规现付成功订单" HeaderText="常规现付成功订单" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="常规现付客单价" HeaderText="常规现付客单价" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="用户取消订单数" HeaderText="用户取消订单数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="用户取消订单%" HeaderText="%" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="用户取消LM" HeaderText="用户取消LM" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="用户取消常规" HeaderText="用户取消常规" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="CC取消订单数" HeaderText="CC取消订单数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="CC取消订单数%" HeaderText="%" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="CC取消LM" HeaderText="CC取消LM" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="CC取消常规" HeaderText="CC取消常规" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="no-show订单数" HeaderText="no-show订单数" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="no-show订单数%" HeaderText="%" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="no-show订单LM" HeaderText="no-show订单LM" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="no-show订单常规" HeaderText="no-show订单常规" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="LM订单确认时间" HeaderText="LM订单确认时间" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                         <asp:BoundField DataField="常规订单确认时间" HeaderText="常规订单确认时间" ><ItemStyle HorizontalAlign="Center" Width="3%"/></asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black"/>
                    <PagerStyle HorizontalAlign="Right" />
                    <RowStyle CssClass="GView_ItemCSS" />
                    <HeaderStyle CssClass="GView_HeaderCSS" />
                    <AlternatingRowStyle CssClass="GView_AlternatingItemCSS"  />
                </asp:GridView>
                </asp:Panel>
        </div>
        <div id="background" class="pcbackground" style="display: none; "></div> 
        <div id="progressBar" class="pcprogressBar" style="display: none; ">数据加载中，请稍等...</div> 
     </ContentTemplate>
    </asp:UpdatePanel>
</div>
</asp:Content>