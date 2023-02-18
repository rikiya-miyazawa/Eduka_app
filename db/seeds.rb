users = [
  User.create!(
    email: "tanakamai@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "suzukimasato@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "shimodatatsuya@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "nakamuraai@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "iguchisatomi@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "guest@example.com", 
    password: "111111",
  ),
  User.create!(
    email: "admin_guest@example.com", 
    password: "111111",
  )
] 

users.each do |user|
  profile = user.build_profile
  name = '田中花子'
  user.profile.update!(
    name: name,
  )
end

Relationship.create!([
  {superior_id: 2,subordinate_id: 1},
  {superior_id: 1,subordinate_id: 3},
  {superior_id: 2,subordinate_id: 3},
  {superior_id: 2,subordinate_id: 4},
  {superior_id: 2,subordinate_id: 5}
])

Role.create!([
  {name: 'admin'},
  {name: 'manager'}
])

Position.create!([
  {user_id: 1,role_id: 2},
  {user_id: 2,role_id: 1}
])

Division.create!([
  {name: '千葉店'},
  {name: '東京店'},
  {name: '神奈川店'},
  {name: '埼玉店'},
  {name: '茨城店'}
])

Affiliation.create!([
  {user_id: 1,division_id: 1},
  {user_id: 2,division_id: 1},
  {user_id: 3,division_id: 1},
  {user_id: 4,division_id: 2},
  {user_id: 5,division_id: 3}
])

User.find(1).profile.update!(
  name: '田中舞',
  hire_date: '2020-4-1',
  job: 'スタイリスト',
)
User.find(2).profile.update!(
  name: '鈴木雅人',
  hire_date: '2013-6-1',
  job: '店長',
)
User.find(3).profile.update!(
  name: '下田竜也',
  hire_date: '2021-4-1',
  job: 'アシスタント',
)
User.find(4).profile.update!(
  name: '中村あい',
  hire_date: '2017-7-1',
  job: 'チーフスタイリスト',
)
User.find(5).profile.update!(
  name: '井口里美',
  hire_date: '2014-9-1',
  job: '副店長',
)
User.find(6).profile.update!(
  name: 'ゲスト',
  hire_date: '',
  job: '',
)
User.find(7).profile.update!(
  name: '管理者ゲスト',
  hire_date: '',
  job: '',
)

educations = [
  Education.create!(
    user_id: 1,
    division_id: 1,
    name: '技術'
  ),
  Education.create!(
    user_id: 2,
    division_id: 1,
    name: 'マネジメント'
  ),
  Education.create!(
    user_id: 3,
    division_id: 1,
    name: '新人研修'
  ),
  Education.create!(
    user_id: 4,
    division_id: 2,
    name: '毛髪化学'
  ),
  Education.create!(
    user_id: 5,
    division_id: 3,
    name: 'リピート'
  ),
]

educations.each do |education|
  status = education.build_status
  purpose = 'お客様を笑顔にするためです！'
  education.status.update!(
    purpose: purpose,
  )
end

Education.find(1).status.update!(
  purpose: 'お客様にリピートしていただくため、技術の向上を目指します。',
  education_period: '',
  created_date: '2020-4-1',
  remarks: ''
)
Education.find(2).status.update!(
  purpose: '社員が増えたので、社員マネジメントを強化するため。',
  education_period: '',
  created_date: '2018-5-1',
  remarks: ''
)
Education.find(3).status.update!(
  purpose: '現場の一連の流れを覚えるために研修します。',
  education_period: '2021-9/31',
  created_date: '2021-4-1',
  remarks: '接客経験あります'
)
Education.find(4).status.update!(
  purpose: 'ヘアケアマイスター資格取得目指して髪の毛について学習します。',
  education_period: '2019-2-28',
  created_date: '2018-8-1',
  remarks: '試験日:2019/3/1'
)
Education.find(5).status.update!(
  purpose: 'お客様にもう一度来ていただくための営業を習得します。',
  education_period: '',
  created_date: '2016-5-1',
  remarks: ''
)

Subject.create!([
  {
    user_id: 1,
    education_id: 1,
    name: 'シャンプー',
    status: true,
    deadline: '2020-6-1'
  },
  {
    user_id: 2,
    education_id: 2,
    name: '伝え方',
    status: false,
    deadline: ''
  },
  {
    user_id: 3,
    education_id: 3,
    name: 'カラー材作成',
    status: true,
    deadline: '2021-7-1'
  },
  {
    user_id: 4,
    education_id: 4,
    name: 'PHについて',
    status: false,
    deadline: '2018-10-1'
  },
  {
    user_id: 5,
    education_id: 5,
    name: 'アフターカウンセリングについて',
    status: false,
    deadline: ''
  }
])

Teaching.create!([
  {
    user_id: 1,
    subject_id: 1,
    date: '2020-7-23',
    educator: '鈴木雅人',
    title: 'サイドシャンプーの流れについて',
    content: '1.まずはしっかりシャンプークロスをつける。2.手首でお湯の温度確認。3. .......',
    advice: 'クロスが緩すぎると水が背中に入ってしまうので気をつけよう！',
    remarks: '次回2020-7-28'
  },
  {
    user_id: 2,
    subject_id: 2,
    date: '2018-6-4',
    educator: '鈴木雅人',
    title: '指摘する時の言い方について',
    content: '指摘するときに自分の感情任せで言うのではなく、きちんと問題点を明らかにした上でちゃんと改善してもらえるように指摘する。',
    advice: '怒っているというより、成長してほしいと言う気持ちで指摘する。',
    remarks: ''
  },
  {
    user_id: 3,
    subject_id: 3,
    date: '2017-5-22',
    educator: '田中舞',
    title: '6%2倍の計算方法',
    content: '6%2倍のカラー材の総量は1液+2液÷3で1液の分量がわかると教えました。',
    advice: 'きちんと理論を理解していたので、営業中でもカラー材作成できると思います。',
    remarks: '鈴木店長にも一度確認してもらってください。'
  },
  {
    user_id: 4,
    subject_id: 4,
    date: '2018-9-16',
    educator: '鈴木雅人',
    title: 'アルカリと酸性について',
    content: 'ph7が中性で7~14はアルカリ、1~7は酸性ということを教えました。',
    advice: 'アルカリは毛髪を膨潤させ、酸性は毛髪を収れんさせると覚えるといいでしょう。',
    remarks: '試験まで残りもう少し。頑張ってください！'
  },
  {
    user_id: 5,
    subject_id: 5,
    date: '2016-7-12',
    educator: '鈴木雅人',
    title: 'カウンセリングのコツ',
    content: 'カウンセリングはお客様のお悩みをお聞きする、最重要の技術だということを伝えました。',
    advice: 'お客様の服装、一言目、目線、喋り方など総合的に判断してカウンセリングを進めてください。',
    remarks: ''
  }
])