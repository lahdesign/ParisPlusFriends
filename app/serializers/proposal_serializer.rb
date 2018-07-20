class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :project_title, :question_one, :question_two, :question_three
  has_one :user
  has_one :name
end
