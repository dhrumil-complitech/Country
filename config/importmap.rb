# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap.bundle.min"
pin "jquery.min"
pin "select2.min"
pin "datatables.min"
pin "app"
pin "datatables_basic"
pin "demo_configurator"
pin "countries"
pin "states"
pin "cities"