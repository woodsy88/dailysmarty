module PostsHelper

  def form_route(source)
    return create_post_path if source == 'new'
    return topic_post_path(topic_id: @topic.id, id: @post.id) if source == 'edit'
  end

  def form_action(source)
    return 'post' if source == 'new'
    return 'put' if source == 'edit'
  end

end
