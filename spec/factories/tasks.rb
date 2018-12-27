FactoryBot.define do
    factory :task do
        name { 'ELTrainingを完了'}
        description {'すべてのissueを片付ける'}
        user
    end
end
