before_action :authenticate_user!

def index
    @school_subject = subject.includes(:group).all
  end
