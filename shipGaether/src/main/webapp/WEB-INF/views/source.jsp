<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<script src="/js/bootstrap/bootstrap.bundle.min.js"></script>


<link href="/css/styles.css" rel="stylesheet" />
<link href="/css/carousel.css" rel="stylesheet" />
<link href="/css/sidebar.css" rel="stylesheet" />
<link href="/css/bootstrap/bootstrap.min.css" rel="stylesheet" />
<link href="/css/shipMain.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
<style>
* {
	font-family: 'Nanum Gothic', sans-serif;

}

#login_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#login_modal h2 {
	margin: 0;
}

#login_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#login_modal .modal_content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#login_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#signup_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#signup_modal h2 {
	margin: 0;
}

#signup_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#signup_modal .modal_content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}


#signup_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%; 
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#chatting_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#chatting_modal h2 {
	margin: 0;
}

#chatting_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#chatting_modal .modal_content {
	position: fixed;
	top: 72px;
	left: 70%;
	transform: translate(-50%, 0);
}
#chatting_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%; 
	height: 100%;
	background: rgba(0, 0, 0, 0);
	z-index: -1;
}

#create_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#create_modal h2 {
	margin: 0;
}

#create_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#create_modal .modal_content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#create_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

#invite_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#invite_modal h2 {
	margin: 0;
}

#invite_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#invite_modal .modal_content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#invite_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}


/* 동건 아이디/비번 찾기  */
#find_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#find_modal h2 {
	margin: 0;
}

#find_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#find_modal .modal_content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#find_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}

.index-club-main-div {
	width: 130px;
	height: 180px;
	overflow: hidden;
	margin: 0 auto;
}

.index-club-main-div img, index-club-main-div-div {
	width: 130px;
	height: 130px;
	object-fit: cover;
}

.word {
	display: block;
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: normal;
	text-align: left;
	word-wrap: break-word;
	display: -webkit-box;
	-webkit-line-clamp: 5;
	-webkit-box-orient: vertical;
}

.wordOneline {
	display: block;
	width: 100%;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#chattingInfo_modal {
	display: none;
	position: fixed;
	width: 100%;
	height: 100%;
	z-index: 3001;
}

#chattingInfo_modal h2 {
	margin: 0;
}

#chattingInfo_modal button {
	display: inline-block;
	width: 100px;
	margin-left: calc(100% - 100px - 10px);
}

#chattingInfo_modal .modal_content {
	position: fixed;
	top: 58px;
	left: 70%;
	transform: translate(-50%, 0);
}
#chattingInfo_modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%; 
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>


