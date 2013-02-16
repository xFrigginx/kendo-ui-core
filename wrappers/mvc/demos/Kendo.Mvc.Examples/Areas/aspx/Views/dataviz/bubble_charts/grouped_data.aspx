﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/DataViz.Master"
Inherits="System.Web.Mvc.ViewPage<IEnumerable<Kendo.Mvc.Examples.Models.JobGrowth>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style>
    .chart-wrapper {
        position: relative;
    }
</style>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
<div class="chart-wrapper">
    <%= Html.Kendo().Chart<Kendo.Mvc.Examples.Models.BubbleChartsGroupedDataViewModel>()
        .Name("chart")
        .Title("Olypmic Medals Won by Japan")
        .DataSource(ds => ds
            .Read("_Medals", "Bubble_Charts")
            .Group(group => group.Add(model => model.Country))
        )
        .Legend(legend => legend
            .Visible(false)
        )
        .Series(series => {
            series.Bubble(
                model => model.Year,
                model => model.Standing,
                model => model.Number,
                null,
                model => model.Color
            )
            .Opacity(0.9);
        })
        .XAxis(axis => axis
            .Numeric()
            .Labels(labels => labels
                .Margin(-25,0,0,0)
                .Skip(1)
            )
            .MajorUnit(4)
            .Min(1980)
            .Max(2015)
            .MajorGridLines(lines => lines.Visible(false))
            .Line(line => line.Visible(false))
        )
        .YAxis(axis => axis
            .Numeric()
            .Labels(labels => labels
                .Step(1)
                .Skip(1)
                .Template("#= value # place")
                .Margin(0,-30,0,0)
                .Padding(0,0,0,20)
            )
            .MajorUnit(1)
            .Min(0)
            .Max(3.7)
            .Line(line => line.Visible(false))
            .MajorGridLines(lines => lines.Visible(false))
        )
        .Tooltip(tooltip => tooltip
            .Visible(true)
            .Template("#= value.x #: #= value.size # Medals")
        )
    %>
</div>
</asp:Content>
