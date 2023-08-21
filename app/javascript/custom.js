$(document).ready(function(){
  $("#user_info").click(function() {
    $(".user-info").toggleClass("none");
  });

  // for user

  $(".detail-show-user").click(function() {
    $(".detail-user").removeClass("none")
    $(".delete-user").addClass("none")
  })
  $(".delete-show-user").click(function() {
    $(".delete-user").removeClass("none")
    $(".detail-user").addClass("none")
  })
  $(".detail-hide-user").click(function() {
    $(".detail-user").addClass("none")
  })
  $(".delete-hide-user").click(function() {
    $(".delete-user").addClass("none")
  })

  // -------------------------------------------

  // for post

  $(".detail-show-post").click(function() {
    $(".detail-post").removeClass("none")
    $(".delete-post").addClass("none")
  })
  $(".delete-show-post").click(function() {
    $(".delete-post").removeClass("none")
    $(".detail-post").addClass("none")
  })
  $(".detail-hide-post").click(function() {
    $(".detail-post").addClass("none")
  })
  $(".delete-hide-post").click(function() {
    $(".delete-post").addClass("none")
  })

  // -------------------------------------------
});

// for output showUserDetails
function showUserDetails(user_list , create_user_name , updated_user_name) {
  let role;
  
  if (user_list.role == 0) {
    role = "admin";
  } else if (user_list.role == 1) {
    role = "user";
  } else {
    role = undefined;
  }

  let createDataString = user_list.created_at;
  let updateDataString = user_list.updated_at;
  let createDate = new Date(createDataString);
  let updateDate = new Date(updateDataString);
  let createFormatDate = createDate.toLocaleDateString();
  let updateFormatDate = updateDate.toLocaleDateString();

  // let create = user_list.created_at
  // let create_date = create.strftime("%Y-%m-%d")
  // console.log(create_date)

  $('#detail-user-name').html(user_list.name);
  $('#detail-user-role').html(role);
  $('#detail-user-email').html(user_list.email);
  $('#detail-user-phone').html(user_list.phone);
  $('#detail-user-dob').html(user_list.dob);
  $('#detail-user-address').html(user_list.address);
  $('#detail-user-cd').html(createFormatDate);
  $('#detail-user-cu').html(create_user_name);
  $('#detail-user-ud').html(updateFormatDate);
  $('#detail-user-uu').html(updated_user_name);
  // $('#profile-img').attr('src', user_list.avatar);
}
// -------------------------------------------

// for output deleteUserDetails
function deleteUserDetails(user_list , auth) {
  let role;

  if (user_list.role == 0) {
    role = "admin";
  } else if (user_list.role == 1) {
    role = "user";
  } else {
    role = undefined;
  }  

  $('#delete-user-id').html(user_list.id);
  $('#delete-user-name').html(user_list.name);
  $('#delete-user-role').html(role);
  $('#delete-user-email').html(user_list.email);
  $('#delete-user-phone').html(user_list.phone);
  $('#delete-user-dob').html(user_list.dob);
  $('#delete-user-address').html(user_list.address);
  document.getElementById('user_soft_delete').value = user_list.id
  document.getElementById('user_delete_user').value = auth.id
}
// -------------------------------------------

// for output showPostDetails
function showPostDetails(post_list , create_post_name , updated_post_name) {
  let status;

  if (post_list.status == 0) {
    status = "inactive";
  } else if (post_list.status == 1) {
    status = "active";
  } else {
    status = undefined;
  }  

  let createDataString = post_list.created_at;
  let updateDataString = post_list.updated_at;
  let createDate = new Date(createDataString);
  let updateDate = new Date(updateDataString);
  let createFormatDate = createDate.toLocaleDateString();
  let updateFormatDate = updateDate.toLocaleDateString();

  $('#detail-post-title').html(post_list.title);
  $('#detail-post-description').html(post_list.description);
  $('#detail-post-status').html(status);
  $('#detail-post-cd').html(createFormatDate);
  $('#detail-post-cu').html(create_post_name);
  $('#detail-post-ud').html(updateFormatDate);
  $('#detail-post-uu').html(updated_post_name);
}
// -------------------------------------------

// for output deletePostDetails
function deletePostDetails(post_list , auth) {
  let status;
  if (post_list.status == 0) {
    status = "inactive";
  } else if (post_list.status == 1) {
    status = "active";
  } else {
    status = undefined;
  }    

  $('#delete-post-id').html(post_list.id);
  $('#delete-post-title').html(post_list.title);
  $('#delete-post-description').html(post_list.description);
  $('#delete-post-status').html(status);
  document.getElementById('post_soft_delete').value = post_list.id
  document.getElementById('post_delete_user').value = auth.id
}
// -------------------------------------------

