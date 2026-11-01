require 'tk'

class Fixture
  attr_accessor :name, :due_date, :inspection_status

  def initialize(name, due_date, inspection_status)
    @name = name
    @due_date = due_date
    @inspection_status = inspection_status
  end

  def due_for_replacement?
    Time.now >= @due_date
  end

  def due_for_inspection?
    @inspection_status == 'due'
  end
end

class Notification
  def initialize(fixture)
    @fixture = fixture
  end

  def notification_message
    if @fixture.due_for_replacement?
      "Reminder: #{@fixture.name} is due for replacement on #{@fixture.due_date.strftime('%Y-%m-%d')}"
    elsif @fixture.due_for_inspection?
      "Reminder: #{@fixture.name} needs inspection on #{@fixture.due_date.strftime('%Y-%m-%d')}"
    else
      "No reminders for #{@fixture.name}"
    end
  end
end

class FixtureList
  attr_accessor :fixtures

  def initialize
    @fixtures = []
  end

  def add_fixture(name, due_date, inspection_status)
    @fixtures << Fixture.new(name, due_date, inspection_status)
  end

  def remove_fixture(name)
    @fixtures.delete_if { |fixture| fixture.name == name }
  end

  def update_fixture(name, due_date, inspection_status)
    @fixtures.each do |fixture|
      if fixture.name == name
        fixture.due_date = due_date
        fixture.inspection_status = inspection_status
      end
    end
  end

  def schedule_notifications
    @fixtures.each do |fixture|
      if fixture.due_for_replacement? || fixture.due_for_inspection?
        puts Notification.new(fixture).notification_message
      end
    end
  end
end

class GUI
  def initialize
    @root = Tk::Root.new
    @root.title 'Fixture List'
    @frame = Tk::Frame.new(@root)
    @frame.pack

    @name_label = Tk::Label.new(@frame, text: 'Name:')
    @name_label.pack
    @name_entry = Tk::Entry.new(@frame)
    @name_entry.pack

    @due_date_label = Tk::Label.new(@frame, text: 'Due Date (YYYY-MM-DD):')
    @due_date_label.pack
    @due_date_entry = Tk::Entry.new(@frame)
    @due_date_entry.pack

    @inspection_status_label = Tk::Label.new(@frame, text: 'Inspection Status:')
    @inspection_status_label.pack
    @inspection_status_entry = Tk::Entry.new(@frame)
    @inspection_status_entry.pack

    @add_button = Tk::Button.new(@frame, text: 'Add Fixture', command: proc { add_fixture })
    @add_button.pack

    @remove_button = Tk::Button.new(@frame, text: 'Remove Fixture', command: proc { remove_fixture })
    @remove_button.pack

    @update_button = Tk::Button.new(@frame, text: 'Update Fixture', command: proc { update_fixture })
    @update_button.pack

    @schedule_button = Tk::Button.new(@frame, text: 'Schedule Notifications', command: proc { schedule_notifications })
    @schedule_button.pack

    @list_label = Tk::Label.new(@frame, text: 'Fixtures:')
    @list_label.pack
    @list_text = Tk::Text.new(@frame)
    @list_text.pack

    @root.mainloop
  end

  def add_fixture
    name = @name_entry.get
    due_date = @due_date_entry.get
    inspection_status = @inspection_status_entry.get
    @fixtures_list.add_fixture(name, due_date, inspection_status)
    @list_text.insert('end', "#{name} - #{due_date} - #{inspection_status}\n")
    @name_entry.delete(0..-1)
    @due_date_entry.delete(0..-1)
    @inspection_status_entry.delete(0..-1)
  end

  def remove_fixture
    name = @name_entry.get
    @fixtures_list.remove_fixture(name)
    @list_text.delete('1.0', 'end')
    @name_entry.delete(0..-1)
    @due_date_entry.delete(0..-1)
    @inspection_status_entry.delete(0..-1)
  end

  def update_fixture
    name = @name_entry.get
    due_date = @due_date_entry.get
    inspection_status = @inspection_status_entry.get
    @fixtures_list.update_fixture(name, due_date, inspection_status)
    @list_text.delete('1.0', 'end')
    @fixtures_list.fixtures.each do |fixture|
      @list_text.insert('end', "#{fixture.name} - #{fixture.due_date} - #{fixture.inspection_status}\n")
    end
    @name_entry.delete(0..-1)
    @due_date_entry.delete(0..-1)
    @inspection_status_entry.delete(0..-1)
  end

  def schedule_notifications
    @fixtures_list.schedule_notifications
  end
end

fixtures_list = FixtureList.new
gui = GUI.new