package com.macsuite.financial

import org.macsuite.financial.reporting.StaticBudgetService


class SetBudgetJob {
    StaticBudgetService staticBudgetService
    def concurrent = false
    def description = "On the first day of every month, create a static budget for that month to use for comparison"
    static triggers = {
        cron name: 'monthlyTrigger', startDelay: 0, cronExpression: "0 5 0 1 * ?"
    }

    def execute() {
        staticBudgetService.setStaticBudget()
    }
}
