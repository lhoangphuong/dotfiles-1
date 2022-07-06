require 'neotest'.setup({
        adapters = {
                require('neotest-dart') {
                        command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
                },
        }
})
