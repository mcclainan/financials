<%@ page import="org.macsuite.financial.planning.PlannedTransaction" %>
<section class="panel">
    <header class="panel-heading text-center dashboard-heading">
        Cash Flow Calendar<br/>
        <g:formatDate date="${calendarDate}" format="MMMM yyyy"/><br/>
        <g:if test="${calendarDate.clearTime()!=new Date().clearTime()}">
            <g:remoteLink class="btn btn-primary" action="displayCalendar" update="cal" params="['switch':'prev','month':calendarDate.getAt(Calendar.MONTH),'year':calendarDate.getAt(Calendar.YEAR)]">${raw('<')}</g:remoteLink>
        </g:if>
        <g:remoteLink class="btn btn-primary" action="displayCalendar" update="cal" params="['month':calendarDate.getAt(Calendar.MONTH),'year':calendarDate.getAt(Calendar.YEAR)]">Refresh</g:remoteLink>
        <g:remoteLink class="btn btn-primary" action="displayCalendar" update="cal" params="['switch':'next','month':calendarDate.getAt(Calendar.MONTH),'year':calendarDate.getAt(Calendar.YEAR)]">${raw('>')}</g:remoteLink>

        <br/><br/>
    </header>
    <div class="panel-body">
        <div class="table-responsive">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Sunday</th>
                        <th>Monday</th>
                        <th>Tuesday</th>
                        <th>Wednesday</th>
                        <th>Thursday</th>
                        <th>Friday</th>
                        <th>Saturday</th>
                    </tr>
                </thead>
                <tbody>
                    <g:set var="i" value="${1}"/>
                    <g:each in="${beanList}" var="bean" status="i">
                        <g:if test="${bean.dayOfWeek == 1 || i==0}">
                            <tr>
                                <td>
                                    <g:remoteLink update="remote-panel" controller="plannedTransaction"
                                                  action="showCalendarDay" params="[year:calendarDate.getAt(Calendar.YEAR), month:calendarDate.getAt(Calendar.MONTH),day:bean.day]">
                                        ${bean.day}<br/>
                                        <span class="calendar-income pull-right">${bean.income}</span><br/>
                                        <span class="calendar-expense pull-right">${bean.expense}</span><br/>
                                        <g:if test="${bean.remainder}">
                                            <span class="calendar-total pull-right">$${bean.remainder}</span>
                                        </g:if>
                                    </g:remoteLink>
                                </td>
                        </g:if>
                        <g:elseif test="${bean.dayOfWeek !=7}">
                                <td>
                                    <g:remoteLink update="remote-panel" controller="plannedTransaction"
                                                  action="showCalendarDay" params="[year:calendarDate.getAt(Calendar.YEAR), month:calendarDate.getAt(Calendar.MONTH),day:bean.day]">
                                        ${bean.day}<br/>
                                        <span class="calendar-income pull-right">${bean.income}</span><br/>
                                        <span class="calendar-expense pull-right">${bean.expense}</span><br/>
                                        <g:if test="${bean.remainder}">
                                            <span class="calendar-total pull-right">$${bean.remainder}</span>
                                        </g:if>
                                    </g:remoteLink>
                                </td>
                        </g:elseif>
                        <g:else>
                                <td>
                                    <g:remoteLink update="remote-panel" controller="plannedTransaction"
                                                  action="showCalendarDay" params="[year:calendarDate.getAt(Calendar.YEAR), month:calendarDate.getAt(Calendar.MONTH),day:bean.day]">
                                        ${bean.day}<br/>
                                        <span class="calendar-income pull-right">${bean.income}</span><br/>
                                        <span class="calendar-expense pull-right">${bean.expense}</span><br/>
                                        <g:if test="${bean.remainder}">
                                            <span class="calendar-total pull-right">$${bean.remainder}</span>
                                        </g:if>
                                    </g:remoteLink>
                                </td>
                            <tr>
                        </g:else>
                    </g:each>
                </tbody>
            </table>
        </div>
    </div>
</section>
