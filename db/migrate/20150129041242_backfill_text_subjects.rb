class BackfillTextSubjects < ActiveRecord::Migration
  def up
    Shout.all.each do |shout|
      text = shout.body
      text_subject = TextSubject.create(body: text)
      shout.subject_id = text_subject.id
      shout.subject_type = "TextSubject"
      shout.save
    end

    remove_column :shouts, :body

    change_column_null :shouts, :subject_id, false
    change_column_null :shouts, :subject_type, false
  end

  def down
    change_column_null :shouts, :subject_id, true
    change_column_null :shouts, :subject_type, true

    add_column :shouts, :body, :string

    Shout.all.each do |shout|
      text_subject = TextSubject.find(shout.subject_id)
      shout.update(body: text_subject.body)
    end

    change_column_null :shouts, :body, false

    execute "UPDATE shouts SET subject_id = NULL, subject_type = NULL"
    execute "DELETE FROM text_subjects"
  end
end
