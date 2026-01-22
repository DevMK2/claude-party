#!/bin/bash

# 1. 프로젝트 이름 입력 확인
if [ -z "$1" ]; then
  echo "❌ Error: 프로젝트 이름을 입력해주세요."
  echo "사용법: ./setup.sh <project-name>"
  exit 1
fi

PROJECT_NAME=$1

echo "��� Next.js 프로젝트 생성 시작: $PROJECT_NAME"

# 2. Next.js 앱 생성 (비대화형으로 자동 설정)
# --src-dir: src 디렉토리 사용 (Yes)
# --app: App Router 사용 (Yes)
# --import-alias "@/*": 기본 별칭 사용 (No to customize)
# --use-npm: npm 사용 강제 (뒷 단계와 통일)
npx create-next-app@latest "$PROJECT_NAME" \
  --typescript \
  --tailwind \
  --eslint \
  --src-dir \
  --app \
  --import-alias "@/*" \
  --use-npm

# 프로젝트 생성이 실패하면 스크립트 종료
if [ $? -ne 0 ]; then
  echo "❌ Next.js 프로젝트 생성 실패"
  exit 1
fi

# 3. 프로젝트 폴더로 이동
cd "$PROJECT_NAME" || exit

echo "��� Vitest 및 테스트 환경 설치 중..."

# 4. Vitest 및 관련 라이브러리 설치
npm install -D vitest @vitejs/plugin-react jsdom @testing-library/react @testing-library/dom

echo "imager/documentation 구조 생성 중..."

# 5. 문서 구조 생성
mkdir docs
touch docs/TRD.md docs/PLAN.md

echo ""
echo "✅ 설정 완료! 다음 명령어로 시작하세요:"
echo "-------------------------------------"
echo "cd $PROJECT_NAME"
echo "code .  # (VS Code를 사용하는 경우)"
echo "-------------------------------------"
