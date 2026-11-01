# Define a function to add expenses
function Add-Expense {
    param (
        [string]$Date,
        [float]$Amount
    )

    if ($Amount -lt 0) {
        Write-Host "Invalid expense amount. Amount must be greater than or equal to 0."
        return
    }

    $expenses = Get-Date | Group-Object -NoElement | Sort-Object -Property Name
    $expenses += $Date -as [System.DateTime]

    $expenses | Add-MemberNote @{
        Amount = $Amount
    }

    return $expenses
}

# Define a function to calculate the remaining budget
function Calculate-Remaining-Budget {
    param (
        [float]$Budget,
        [float]$ExpenseAmount
    )

    if ($ExpenseAmount -lt 0) {
        Write-Host "Invalid expense amount. Amount must be greater than or equal to 0."
        return
    }

    $remainingBudget = $Budget - $ExpenseAmount
    return $remainingBudget
}

# Main script
if ($PSVersionTable.PSVersion.Major -eq 5) {
    # PowerShell 5 or later
    Add-Type -MemberDefinition '[System.DateTime]' -Name DateTime
}

$budget = Read-Host "Enter the monthly budget"
$expenseAmount = Read-Host "Enter the daily expense amount"

$expenses = Add-Expense -Date (Get-Date).ToString("yyyy-MM-dd") -Amount $expenseAmount
$remainingBudget = Calculate-Remaining-Budget -Budget $budget -ExpenseAmount $expenseAmount

Write-Host "Expenses:"
$expenses | Format-Table -Property Name, Amount

Write-Host "Remaining budget: $($remainingBudget)"