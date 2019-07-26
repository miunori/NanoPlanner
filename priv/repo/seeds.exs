# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     NanoPlanner.Repo.insert!(%NanoPlanner.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

import NanoPlanner.Repo
alias NanoPlanner.Repo
alias NanoPlanner.PlanItem

time0 = Timex.now("Asia/Tokyo") |> Timex.beginning_of_day()
time1 = time0 |> Timex.beginning_of_year()

NanoPlanner.Repo.insert! %NanoPlanner.PlanItem{
  name: "読書",
  description: "走れメロスを読む",
  starts_at: Timex.shift(time0, days: 1, hours: 10),
  ends_at: Timex.shift(time0, days: 1, hours: 11)
}

NanoPlanner.Repo.insert! %NanoPlanner.PlanItem{
  name: "買い物",
  description: "洗剤を買う",
  starts_at: Timex.shift(time0, hours: 16),
  ends_at: Timex.shift(time0, hours: 16, minutes: 30)
}

NanoPlanner.Repo.insert! %NanoPlanner.PlanItem{
  name: "帰省",
  description: "新幹線の指定席を取る。\nお土産を買う",
  starts_at: Timex.shift(time1, years: 1, days: -2),
  ends_at: Timex.shift(time1, years: 1, days: 3)
}
