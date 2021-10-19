module ReviewUpSupport
    def review_up(review)
    # レビュー作成ページに遷移する
    visit location_review_path(@location)
  
    # レビューの存在の確認
    expect(page).to have_selector '#star'
    expect(page).to have_selector '#star'
    expect(page).to have_selector '#star'
    expect(page).to have_selector '#star'
    expect(page).to have_selector '#star'
  
    # 星マークにカーソルを合わた場所でクリックする（今回は3段階）
    expect(find('#star').hover.click)
  
    # レビューのコメントに情報を入力する
    fill_in 'review[content]', with: review.content
  end
