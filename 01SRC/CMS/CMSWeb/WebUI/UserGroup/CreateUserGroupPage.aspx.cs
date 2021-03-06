﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Data.OracleClient;
using System.Data;
using System.Collections;
using System.Configuration;

using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.Services;

using HotelVp.Common.DBUtility;
using HotelVp.CMS.Domain.Process;
using HotelVp.CMS.Domain.Entity;

public partial class CreateUserGroupPage : BasePage
{
    UserGroupEntity _userGroupEntity = new UserGroupEntity();
    CommonEntity _commonEntity = new CommonEntity();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRegChannelDDL();
            BindUserGroupListGrid();
            this.Page.ClientScript.RegisterStartupScript(this.Page.GetType(), "key", "ClearClickEvent();", true);
        }
        //messageContent.InnerHtml = "";
    }

    //public DataSet ddlOnlinebind()
    //{
    //    DataSet dsResult = CommonBP.GetConfigList(GetLocalResourceObject("OnlineType").ToString());
    //    DataTable dtResult = new DataTable();
    //    dtResult.Columns.Add("ONLINESTATUS");
    //    dtResult.Columns.Add("ONLINEDIS");
    //    if (dsResult.Tables.Count > 0)
    //    {
    //        dsResult.Tables[0].Columns["Key"].ColumnName = "ONLINESTATUS";
    //        dsResult.Tables[0].Columns["Value"].ColumnName = "ONLINEDIS";
    //    }
    //    return dsResult;
    //}

    private void BindRegChannelDDL()
    {
        _userGroupEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
        _userGroupEntity.LogMessages.Userid = UserSession.Current.UserAccount;
        _userGroupEntity.LogMessages.Username = UserSession.Current.UserDspName;
        _userGroupEntity.LogMessages.IpAddress = UserSession.Current.UserIP;

        DataSet dsResult = UserGroupBP.GetRegChannelList(_userGroupEntity).QueryResult;
        ddpRegChannelList.DataTextField = "REGCHANELNM";
        ddpRegChannelList.DataValueField = "REGCHANELCODE";
        ddpRegChannelList.DataSource = dsResult;
        ddpRegChannelList.DataBind();

        DataSet dsPlatFormResult = UserGroupBP.GetPlatFormList(_userGroupEntity).QueryResult;
        chkPlatformList.DataTextField = "PLATFORMNM";
        chkPlatformList.DataValueField = "PLATFORMCODE";
        chkPlatformList.DataSource = dsPlatFormResult;
        chkPlatformList.DataBind();
    }

    //protected void btnAddUserGroup_Click(object sender, EventArgs e)
    //{
    //    //btnAddChannel();
    //    //BindChanelListGrid();
    //    string RergChannleList = hidRegChannelList.Value;

    //    foreach (ListItem li in chkPlatformList.Items)
    //    {
    //        if (li.Selected)
    //        {
                
    //        }
    //    }


    //}

    //[WebMethod]
    //public static string AddUserGroup(string parm)
    //{

    //    AddUserGroupList();
    //    return "123--->456";
    //}

    //private static string AddUserGroupList()
    //{

    //    return "";
    //}

    //[System.Web.Services.WebMethod]
    //public static string GetDataTable()
    //{
    //    return DataTable2Json(CreateDataTable());
    //}

    //public static System.Data.DataTable CreateDataTable()
    //{
    //    System.Data.DataTable dataTable1 = new System.Data.DataTable("BlogUser");
    //    System.Data.DataRow dr;
    //    dataTable1.Columns.Add(new System.Data.DataColumn("UserId", typeof(System.Int32)));
    //    dataTable1.Columns.Add(new System.Data.DataColumn("UserName", typeof(System.String)));
    //    dataTable1.PrimaryKey = new System.Data.DataColumn[] { dataTable1.Columns["UserId"] };

    //    for (int i = 0; i < 8; i++)
    //    {
    //        dr = dataTable1.NewRow();
    //        dr[0] = i;
    //        dr[1] = "【孟子E章】" + i.ToString() + " 前端传递的参数的值分别是:";//<script>alert('123')</script>
    //        dataTable1.Rows.Add(dr);
    //    }
    //    return dataTable1;
    //}

    //public static string DataTable2Json(System.Data.DataTable dt)
    //{
    //    StringBuilder jsonBuilder = new StringBuilder();
    //    jsonBuilder.Append("{\"");
    //    jsonBuilder.Append(dt.TableName.ToString());
    //    jsonBuilder.Append("\":[");
    //    for (int i = 0; i < dt.Rows.Count; i++)
    //    {
    //        jsonBuilder.Append("{");
    //        for (int j = 0; j < dt.Columns.Count; j++)
    //        {
    //            jsonBuilder.Append("\"");
    //            jsonBuilder.Append(dt.Columns[j].ColumnName);
    //            jsonBuilder.Append("\":\"");
    //            jsonBuilder.Append(dt.Rows[i][j].ToString());
    //            jsonBuilder.Append("\",");
    //        }
    //        jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
    //        jsonBuilder.Append("},");
    //    }
    //    jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
    //    jsonBuilder.Append("]");
    //    jsonBuilder.Append("}");
    //    return jsonBuilder.ToString();
    //}  


    //[WebMethod]
    //public static void dddddddaaaaaa()
    //{
    //    string RergChannleList = "";
    //}

    //protected void btnAddRegChannel_Click(object sender, EventArgs e)
    //{
        //LinkButton lkbtn = new LinkButton();

        //lkbtn.Text = ddpRegChannelList.SelectedItem.ToString();
        //lkbtn.ID = "lkbtn_" + ddpRegChannelList.SelectedValue.ToString();
        //lkbtn.Click
        //dvRegChannelList.Controls.Remove();
        //dvRegChannelList.Controls.Add(lkbtn);
        //btnAddChannel();
        //BindChanelListGrid();
    //}

    ////清除控件中的数据
    //private void clearValue()
    //{
    //}

    ////发放渠道
    private void BindUserGroupListGrid()
    {
        _userGroupEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
        _userGroupEntity.LogMessages.Userid = UserSession.Current.UserAccount;
        _userGroupEntity.LogMessages.Username = UserSession.Current.UserDspName;
        _userGroupEntity.LogMessages.IpAddress = UserSession.Current.UserIP;

        _userGroupEntity.UserGroupDBEntity = new List<UserGroupDBEntity>();
        UserGroupDBEntity usergroupEntity = new UserGroupDBEntity();


        DataSet dsResult = UserGroupBP.CreateUserSelect(_userGroupEntity).QueryResult;

        gridViewCSCreateUserGroupList.DataSource = dsResult.Tables[0].DefaultView;
        gridViewCSCreateUserGroupList.DataKeyNames = new string[] { "ID" };//主键
        gridViewCSCreateUserGroupList.DataBind();        
    }

    protected void gridViewCSCreateUserGroupList_RowDataBound(object sender, GridViewRowEventArgs e)
    {
    //    //this.gridViewRegion.PageIndex = e.NewPageIndex;
    //    //BindGridView();

    //    //执行循环，保证每条数据都可以更新
    //    for (int i = 0; i <= gridViewCSChannelList.Rows.Count; i++)
    //    {
    //        //首先判断是否是数据行
    //        if (e.Row.RowType == DataControlRowType.DataRow)
    //        {
    //            //当鼠标停留时更改背景色
    //            e.Row.Attributes.Add("onmouseover", "c=this.style.backgroundColor;this.style.backgroundColor='#f6f6f6'");
    //            //当鼠标移开时还原背景色
    //            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=c");
    //        }
    //    }
    }
    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    //BindChanelListGrid();\

        
    //    UpdatePanel2.Update();
    //}

    protected void gridViewCSCreateUserGroupList_RowEditing(object sender, GridViewEditEventArgs e)
    {
    //    gridViewCSChannelList.EditIndex = e.NewEditIndex;
    //    BindChanelListGrid();
    //    ((DropDownList)gridViewCSChannelList.Rows[e.NewEditIndex].Cells[7].FindControl("ddlOnline")).Enabled = true;
    }

    protected void gridViewCSCreateUserGroupList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
    //    string channelNo = gridViewCSChannelList.DataKeys[e.RowIndex].Value.ToString();
    //    string channelID = gridViewCSChannelList.Rows[e.RowIndex].Cells[3].Text;
    //    string nameCN = ((TextBox)(gridViewCSChannelList.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
    //    string onlineStatus = ((DropDownList)gridViewCSChannelList.Rows[e.RowIndex].Cells[7].FindControl("ddlOnline")).SelectedValue;
    //    if (String.IsNullOrEmpty(nameCN))
    //    {
    //        messageContent.InnerHtml = GetLocalResourceObject("Error3").ToString();
    //        return;
    //    }
    //    btnUpdateChannel(channelNo, channelID, nameCN, onlineStatus);
    //    gridViewCSChannelList.EditIndex = -1;
    //    BindChanelListGrid();
    }

    protected void gridViewCSCreateUserGroupList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
    //    gridViewCSChannelList.EditIndex = -1;
    //    BindChanelListGrid();
    }

    //public void btnAddChannel()
    //{
    //    messageContent.InnerHtml = "";

    //    if (String.IsNullOrEmpty(txtChannelName.Value.ToString().Trim()) || String.IsNullOrEmpty(txtChannelID.Value.ToString().Trim()))
    //    {
    //        messageContent.InnerHtml = GetLocalResourceObject("Error3").ToString();
    //        return;
    //    }

    //    _userGroupEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
    //    _commonEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
    //    _userGroupEntity.LogMessages.Userid = "test";
    //    _userGroupEntity.LogMessages.Username = "test";

    //    _userGroupEntity.UserGroupEntity = new List<UserGroupEntity>();
    //    UserGroupEntity usergroupEntity = new UserGroupEntity();
    //    usergroupEntity.Name_CN = txtChannelName.Value;
    //    usergroupEntity.ChannelID = txtChannelID.Value;
    //    _userGroupEntity.UserGroupEntity.Add(usergroupEntity);
    //    int iResult = ChannelBP.Insert(_userGroupEntity);

    //    _commonEntity.LogMessages = _userGroupEntity.LogMessages;
    //    _commonEntity.CommonDBEntity = new List<CommonDBEntity>();
    //    CommonDBEntity commonDBEntity = new CommonDBEntity();

    //    commonDBEntity.Event_Type = "";
    //    commonDBEntity.Event_ID = "";



    //    string conTent = GetLocalResourceObject("EventInsertMessage").ToString();
    //    conTent = string.Format(conTent, txtChannelID.Value, txtChannelName.Value);
    //    commonDBEntity.Event_Content = conTent;

    //    if (iResult == 1)
    //    {
    //        commonDBEntity.Event_Result = GetLocalResourceObject("InsertSuccess").ToString();
    //        messageContent.InnerHtml = GetLocalResourceObject("InsertSuccess").ToString();
    //    }
    //    else if (iResult == 2)
    //    {
    //        commonDBEntity.Event_Result = GetLocalResourceObject("Error1").ToString();
    //        messageContent.InnerHtml = GetLocalResourceObject("Error1").ToString();
    //    }
    //    else
    //    {
    //        commonDBEntity.Event_Result = GetLocalResourceObject("Error2").ToString();
    //        messageContent.InnerHtml = GetLocalResourceObject("Error2").ToString();
    //    }

    //    _commonEntity.CommonDBEntity.Add(commonDBEntity);
    //    CommonBP.InsertEventHistory(_commonEntity);
    //}

    //public void btnUpdateChannel(string channelNo, string channelID, string nameCN, string onlineStatus)
    //{
    //    messageContent.InnerHtml = "";

    //    _userGroupEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
    //    _commonEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
    //    _userGroupEntity.LogMessages.Userid = "test";
    //    _userGroupEntity.LogMessages.Username = "test";

    //    _userGroupEntity.UserGroupEntity = new List<UserGroupEntity>();
    //    UserGroupEntity usergroupEntity = new UserGroupEntity();
    //    usergroupEntity.ChannelNo = channelNo;
    //    usergroupEntity.ChannelID = channelID;
    //    usergroupEntity.Name_CN = nameCN;
    //    usergroupEntity.OnlineStatus = onlineStatus;
    //    _userGroupEntity.UserGroupEntity.Add(usergroupEntity);
    //    int iResult = ChannelBP.Update(_userGroupEntity);

    //    _commonEntity.LogMessages = _userGroupEntity.LogMessages;
    //    _commonEntity.CommonDBEntity = new List<CommonDBEntity>();
    //    CommonDBEntity commonDBEntity = new CommonDBEntity();

    //    commonDBEntity.Event_Type = "";
    //    commonDBEntity.Event_ID = "";

    //    string conTent = GetLocalResourceObject("EventUpdateMessage").ToString();
    //    conTent = string.Format(conTent, usergroupEntity.ChannelID, usergroupEntity.Name_CN, usergroupEntity.OnlineStatus);
    //    commonDBEntity.Event_Content = conTent;
        
    //    if (iResult == 1)
    //    {
    //        commonDBEntity.Event_Result = GetLocalResourceObject("UpdateSuccess").ToString();
    //        messageContent.InnerHtml = GetLocalResourceObject("UpdateSuccess").ToString();
    //    }
    //    else
    //    {
    //        commonDBEntity.Event_Result = GetLocalResourceObject("UpdateError").ToString();
    //        messageContent.InnerHtml = GetLocalResourceObject("UpdateError").ToString();
    //    }

    //    _commonEntity.CommonDBEntity.Add(commonDBEntity);
    //    CommonBP.InsertEventHistory(_commonEntity);
    //}


    private bool checkNum(string param)
    {
        bool bReturn = true;

        if (String.IsNullOrEmpty(param))
        {
            return bReturn;
        }

        try
        {
            return IsVali(param);
        }
        catch 
        {
            bReturn = false;
        }

        return bReturn;
    }

    public bool IsVali(string str)
    {
        bool flog = false;
        string strPatern = @"^([0-9]\d*)$";
        Regex reg = new Regex(strPatern);
        if (reg.IsMatch(str))
        {
            flog = true;
        }
        return flog;
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        //ProgressBar1.Value = 50;
        messageContent.InnerHtml = "";

        if (String.IsNullOrEmpty(txtUserGroupNM.Value.ToString().Trim()) || String.IsNullOrEmpty(txtUserGroupNM.Value.ToString().Trim()))
        {
            messageContent.InnerHtml = GetLocalResourceObject("Error3").ToString();
            //UpdatePanel2.Update();
            return;
        }

        if (!checkNum(txtSubmitOrderFrom.Value.ToString().Trim()) || !checkNum(txtSubmitOrderTo.Value.ToString().Trim()) || !checkNum(txtCompleteOrderFrom.Value.ToString().Trim()) || !checkNum(txtCompleteOrderTo.Value.ToString().Trim()))
        {
            messageContent.InnerHtml = GetLocalResourceObject("Error4").ToString();
            return;
        }


        if ((!String.IsNullOrEmpty(txtSubmitOrderFrom.Value.ToString().Trim()) && !String.IsNullOrEmpty(txtSubmitOrderTo.Value.ToString().Trim())) && (int.Parse(txtSubmitOrderFrom.Value.ToString().Trim()) > int.Parse(txtSubmitOrderTo.Value.ToString().Trim())))
        {
            messageContent.InnerHtml = GetLocalResourceObject("Error6").ToString();
            return;
        }

        if ((!String.IsNullOrEmpty(txtCompleteOrderFrom.Value.ToString().Trim()) && !String.IsNullOrEmpty(txtCompleteOrderTo.Value.ToString().Trim())) && (int.Parse(txtCompleteOrderFrom.Value.ToString().Trim()) > int.Parse(txtCompleteOrderTo.Value.ToString().Trim())))
        {
            messageContent.InnerHtml = GetLocalResourceObject("Error7").ToString();
            return;
        }

        _userGroupEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
        _commonEntity.LogMessages = new HotelVp.Common.Logger.LogMessage();
        _userGroupEntity.LogMessages.Userid = UserSession.Current.UserAccount;
        _userGroupEntity.LogMessages.Username = UserSession.Current.UserDspName;
        _userGroupEntity.LogMessages.IpAddress = UserSession.Current.UserIP;

        _userGroupEntity.UserGroupDBEntity = new List<UserGroupDBEntity>();
        UserGroupDBEntity usergroupEntity = new UserGroupDBEntity();

        usergroupEntity.UserGroupNM = txtUserGroupNM.Value.ToString().Trim();

        usergroupEntity.RegChannelList = hidRegChannelList.Value.ToString().Trim();
        usergroupEntity.PlatformList = hidPlatformList.Value.ToString().Trim();

        usergroupEntity.RegistStart = dpRegistStart.Value;
        usergroupEntity.RegistEnd = dpRegistEnd.Value;

        usergroupEntity.LoginStart = dpLoginStart.Value;
        usergroupEntity.LoginEnd = dpLoginEnd.Value;

        usergroupEntity.SubmitOrderFrom = txtSubmitOrderFrom.Value.ToString().Trim();
        usergroupEntity.SubmitOrderTo = txtSubmitOrderTo.Value.ToString().Trim();

        usergroupEntity.CompleteOrderFrom = txtCompleteOrderFrom.Value.ToString().Trim();
        usergroupEntity.CompleteOrderTo = txtCompleteOrderTo.Value.ToString().Trim();

        usergroupEntity.LastOrderStart = dpLastOrderStart.Value;
        usergroupEntity.LastOrderEnd = dpLastOrderEnd.Value;

        usergroupEntity.ManualAdd = txtManualAdd.Text.ToString().Trim();

        _userGroupEntity.UserGroupDBEntity.Add(usergroupEntity);
        int iResult = UserGroupBP.Insert(_userGroupEntity);

        _commonEntity.LogMessages = _userGroupEntity.LogMessages;
        _commonEntity.CommonDBEntity = new List<CommonDBEntity>();
        CommonDBEntity commonDBEntity = new CommonDBEntity();

        commonDBEntity.Event_Type = "新建用户组-添加";
        commonDBEntity.Event_ID = txtUserGroupNM.Value.ToString().Trim();
        string conTent = GetLocalResourceObject("EventInsertMessage").ToString();
        conTent = string.Format(conTent, txtUserGroupNM.Value, "");
        commonDBEntity.Event_Content = conTent;

        if (iResult == 1)
        {
            commonDBEntity.Event_Result = GetLocalResourceObject("InsertSuccess").ToString();
            messageContent.InnerHtml = GetLocalResourceObject("InsertSuccess").ToString();
        }
        else if (iResult == 2)
        {
            commonDBEntity.Event_Result = GetLocalResourceObject("Error1").ToString();
            messageContent.InnerHtml = GetLocalResourceObject("Error1").ToString();
        }
        else if (iResult == 3)
        {
            string errTent = GetLocalResourceObject("Error5").ToString();
            errTent = string.Format(errTent, (_userGroupEntity.UserGroupDBEntity.Count > 0 ) ? _userGroupEntity.UserGroupDBEntity[0].ErrManualAdd : "");

            commonDBEntity.Event_Result = errTent;
            messageContent.InnerHtml = errTent;
        }
        else
        {
            commonDBEntity.Event_Result = GetLocalResourceObject("Error2").ToString();
            messageContent.InnerHtml = GetLocalResourceObject("Error2").ToString();
        }

        _commonEntity.CommonDBEntity.Add(commonDBEntity);

        int maxLength = String.IsNullOrEmpty(ConfigurationManager.AppSettings["MaxLengthCount"]) ? 500 : int.Parse(ConfigurationManager.AppSettings["MaxLengthCount"].ToString());
        if (iResult == 1 || iResult == 3)
        {
            DataSet dsHistory = UserGroupBP.GetHistoryInsert(_userGroupEntity);

            if (dsHistory.Tables.Count > 0 && dsHistory.Tables[0].Rows.Count > 0)
            {
                int iCount = 0;
                string phoneString = "";
                foreach (DataRow drRow in dsHistory.Tables[0].Rows)
                {
                    phoneString = phoneString + drRow[0].ToString() + ",";
                    iCount = iCount + 1;
                    if (iCount == maxLength)
                    {
                        phoneString = phoneString.Substring(0, phoneString.Length - 1);
                        conTent = GetLocalResourceObject("EventInsertMessage").ToString();
                        conTent = string.Format(conTent, txtUserGroupNM.Value, phoneString);
                        _commonEntity.CommonDBEntity[0].Event_Content = conTent;
                        CommonBP.InsertEventHistory(_commonEntity);
                        phoneString = "";
                        iCount = 0;
                    }

                }

                if (iCount > 0)
                {
                    phoneString = phoneString.Substring(0, phoneString.Length - 1);
                    conTent = GetLocalResourceObject("EventInsertMessage").ToString();
                    conTent = string.Format(conTent, txtUserGroupNM.Value, phoneString);
                    _commonEntity.CommonDBEntity[0].Event_Content = conTent;
                    CommonBP.InsertEventHistory(_commonEntity);
                }
            }
            else
            {
                conTent = GetLocalResourceObject("EventInsertMessage").ToString();
                conTent = string.Format(conTent, txtUserGroupNM.Value, "");
                _commonEntity.CommonDBEntity[0].Event_Content = conTent;
                CommonBP.InsertEventHistory(_commonEntity);
            }
        }
        else
        {
            //_commonEntity.CommonDBEntity.Add(commonDBEntity);
            CommonBP.InsertEventHistory(_commonEntity);
        }

        hidRegChannelList.Value = "";
        hidPlatformList.Value = "";
        BindUserGroupListGrid();
        //UpdatePanel1.Update();
        //ProgressBar1.Value = 100;
    }
}