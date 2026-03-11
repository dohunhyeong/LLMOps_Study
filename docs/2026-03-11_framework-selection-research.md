# Framework Selection Research — 2026-03-11

이 문서는 Book 개선안 중 **"언제 쓰고 언제 쓰지 말아야 하는가"** 섹션을 안전하게 작성하기 위한 사전 리서치 메모다.

원칙:
- 먼저 저장소 내부 문서를 근거로 정리한다.
- 부족한 부분만 공식 문서(1차 출처)로 보강한다.
- 아래 내용은 Book 본문에 바로 넣기 전의 **근거 요약**이다.

---

## 1. 공통 상위 정리

### 로컬 근거
- `docs/skills/framework-selection.md`
- `docs/langchain/01-overview.md`
- `docs/langgraph/04-workflows-agents.md`
- `docs/deepagents/01-overview.md`에 해당하는 로컬 정리본들

### 공식 근거
- LangChain overview  
  https://docs.langchain.com/oss/python/langchain/overview
- Frameworks, runtimes, and harnesses  
  https://docs.langchain.com/oss/python/concepts/products

### 핵심 정리
- **LangChain**은 빠르게 시작하는 상위 프레임워크다.
- **LangGraph**는 더 낮은 수준의 오케스트레이션/런타임이다.
- **Deep Agents**는 LangGraph 위에 계획, 파일시스템, 서브에이전트, 컨텍스트 관리까지 포함한 하네스다.

### Book에 넣기 좋은 안전한 문장 초안
- LangChain 공식 문서는 에이전트를 빠르게 만들고 싶다면 LangChain 또는 Deep Agents에서 시작하라고 안내한다.
- LangGraph는 결정론적 단계와 에이전트 단계를 섞어야 하거나, 더 세밀한 제어가 필요할 때 적합하다.
- Deep Agents는 계획, 파일 관리, 서브에이전트, 장기 실행 같은 "batteries-included" 기능이 필요한 경우에 유리하다.

---

## 2. LangChain — 언제 쓰는가 / 언제 쓰지 않는가

### 로컬 근거
- `docs/skills/framework-selection.md`
- `docs/langchain/03-agents.md`
- `docs/langchain/10-middleware-overview.md`

### 공식 근거
- LangChain overview  
  https://docs.langchain.com/oss/python/langchain/overview

### 언제 쓰는가
- 간단한 도구 호출 에이전트를 빠르게 만들고 싶을 때
- 모델/도구/프롬프트/미들웨어 조합으로 충분할 때
- 복잡한 그래프 설계 없이 ReAct 루프 기반 에이전트로 해결 가능할 때
- 커스텀 워크플로까지는 필요 없고, 빠른 프로토타이핑이 중요할 때

### 언제 쓰지 않는가
- 명시적인 상태 전이, 다단 분기, 병렬 병합, 중단/재개 지점을 직접 제어해야 할 때
- 장시간 상태 저장, durable execution, 복잡한 multi-stage workflow가 핵심일 때
- 파일시스템/계획/서브에이전트 같은 하네스 기능이 기본으로 필요할 때

### Book용 표현 초안
- **쓰는 경우:** 단일 에이전트, 간단한 도구 호출, 빠른 프로토타입, 비교적 짧은 실행 흐름
- **안 쓰는 경우:** 그래프 수준 분기/병렬/재개 제어가 핵심이거나, 장기 실행형 작업 에이전트가 필요한 경우

---

## 3. LangGraph — 언제 쓰는가 / 언제 쓰지 않는가

### 로컬 근거
- `docs/langgraph/04-workflows-agents.md`
- `docs/langgraph/choosing-apis`에 대응하는 로컬 요약
- `docs/skills/langgraph-fundamentals.md`

### 공식 근거
- Workflows and agents  
  https://docs.langchain.com/oss/python/langgraph/workflows-agents
- Choosing between Graph and Functional APIs  
  https://docs.langchain.com/oss/python/langgraph/choosing-apis
- Custom workflow  
  https://docs.langchain.com/oss/python/langchain/multi-agent/custom-workflow

### 언제 쓰는가
- 조건 분기와 결정 트리가 많을 때
- 여러 노드가 같은 상태를 공유해야 할 때
- 병렬 실행 후 결과를 병합해야 할 때
- 사람 개입(HITL), 인터럽트, durable execution이 중요할 때
- 팀 단위로 워크플로를 시각적으로 문서화/디버깅해야 할 때
- 표준 패턴(subagents, skills 등)만으로는 맞지 않는 bespoke workflow가 필요할 때

### 언제 쓰지 않는가
- 절차가 짧고 선형이며, 단일 에이전트 루프로 충분할 때
- 기존 procedural code에 최소 수정만 원할 때는 Functional API 또는 LangChain이 더 가볍다
- 파일시스템, 계획, context compression 같은 하네스 기능이 기본 요구사항이면 Deep Agents가 더 적합할 수 있다

### Book용 표현 초안
- **쓰는 경우:** 복잡한 워크플로, 병렬 처리, 조건부 라우팅, 사람 승인, 재개/복구
- **안 쓰는 경우:** 단순한 single-agent 문제를 굳이 그래프로 분해할 필요가 없을 때

---

## 4. Deep Agents — 언제 쓰는가 / 언제 쓰지 않는가

### 로컬 근거
- `docs/deepagents/05-harness.md`
- `docs/deepagents/06-backends.md`
- `docs/deepagents/07-subagents.md`
- `docs/deepagents/11-sandboxes.md`
- `docs/skills/framework-selection.md`

### 공식 근거
- Deep Agents overview  
  https://docs.langchain.com/oss/python/deepagents/overview
- Frameworks, runtimes, and harnesses  
  https://docs.langchain.com/oss/python/concepts/products
- Subagents  
  https://docs.langchain.com/oss/python/deepagents/subagents

### 언제 쓰는가
- 복잡한 멀티스텝 작업을 계획/분해해야 할 때
- 파일시스템 기반 컨텍스트 관리가 필요할 때
- 서브에이전트로 context quarantine을 하고 싶을 때
- 메모리를 스레드 간에 유지하고 싶을 때
- 장기 실행형 코딩/리서치/분석 에이전트를 만들 때
- 샌드박스, skills, memory, HITL을 한데 묶은 하네스가 필요할 때

### 언제 쓰지 않는가
- 단순한 single-step 또는 짧은 도구 호출 문제
- 중간 컨텍스트를 메인 에이전트가 계속 직접 봐야 하는 경우
- 오버헤드보다 이득이 작은 작은 태스크
- 그래프를 아주 세밀하게 설계/설명해야 하는데 하네스 추상화가 오히려 숨김이 되는 경우

### Book용 표현 초안
- **쓰는 경우:** 코딩, 리서치, 파일 조작, 장기 실행, 자율 계획, 컨텍스트 격리
- **안 쓰는 경우:** 간단한 FAQ/툴 호출 문제처럼 LangChain으로 끝나는 경우

---

## 5. 멀티에이전트 패턴별 사용 기준

### 서브에이전트
근거:
- https://docs.langchain.com/oss/python/deepagents/subagents
- `docs/langchain/19-subagents.md`

**쓰는 경우**
- 큰 도구 출력 때문에 메인 컨텍스트가 쉽게 부풀 때
- 전문 역할별 지시사항과 도구를 분리해야 할 때
- 메인 에이전트는 조정만 하고, 세부 작업은 격리하고 싶을 때

**안 쓰는 경우**
- 단일 단계 작업
- 중간 추론 결과를 메인 컨텍스트가 직접 계속 참조해야 할 때
- 서브에이전트 호출 오버헤드가 이득보다 클 때

### Handoffs
근거:
- `docs/langchain/20-handoffs.md`

**쓰는 경우**
- 상태에 따라 역할/행동이 순차적으로 바뀌는 대화형 플로우
- 고객 지원처럼 단계가 정해진 워크플로

**안 쓰는 경우**
- 메인 감독자가 한 번에 여러 전문 에이전트를 조율하는 구조
- 단순 분기만 있지, 상태 기반 역할 전환이 필요 없을 때

---

## 6. RAG에서 Agent / Chain / Graph 선택 기준 (초안용)

### 로컬 근거
- `docs/skills/langchain-rag.md`
- `book/chapters/part5/ch05.typ`

### 현재 안전한 수준의 정리
- **RAG Chain**: 비용과 지연을 예측 가능하게 유지해야 하는 단순 Q&A
- **RAG Agent**: 추가 검색 여부나 도구 사용을 에이전트가 스스로 결정해야 하는 경우
- **LangGraph Custom RAG**: 관련성 평가, rewrite, retry, 종료 조건을 명시적으로 통제해야 하는 경우

### 주의
- 이 부분은 Book 본문에 넣기 전에 LangChain 공식 RAG/agent 문서에서 한 번 더 보강하는 것이 안전하다.

---

## 7. 바로 Book에 반영 가능한 문장 / 추가 검증 필요한 문장

### 바로 반영 가능
- LangChain = 빠른 시작, 간단한 에이전트
- LangGraph = 복잡한 오케스트레이션과 세밀한 제어
- Deep Agents = 계획/파일/서브에이전트/메모리를 포함한 복합 작업 하네스
- Subagents는 context bloat 완화에 유용하지만 단순 작업에는 과할 수 있음

### 추가 공식 근거를 더 확인하고 반영할 것
- RAG Agent vs Chain vs Graph 세부 선택 기준
- HITL이 "필수"인 구체 조건
- Deep Agents가 항상 첫 선택인지, 특정 범주에서만 추천되는지의 표현 강도

---

## 8. 다음 액션

1. 위 내용을 바탕으로 Book의 비교/선택 장에 `언제 쓰는가 / 언제 쓰지 않는가` 박스를 추가한다.
2. RAG/SQL/HITL 관련 판단 문장은 공식 문서 추가 확인 후만 넣는다.
3. 문장마다 가능하면 출처를 장 끝 참고 문서에 연결한다.

---

## 9. 공식 문서 재확인 메모 (2026-03-11)

아래 공식 문서들을 다시 확인하여, 표현 강도가 과도하지 않도록 정리했다.

### LangChain Overview
- 출처: https://docs.langchain.com/oss/python/langchain/overview
- 확인 포인트:
  - LangChain은 빠르게 에이전트를 만들 수 있는 상위 프레임워크다.
  - 고급 요구사항에서는 LangGraph 또는 Deep Agents를 함께 고려하라고 안내한다.

### Frameworks, runtimes, and harnesses
- 출처: https://docs.langchain.com/oss/python/concepts/products
- 확인 포인트:
  - LangGraph는 더 높은 제어와 내구성 실행을 담당하는 런타임 계층이다.
  - Deep Agents는 계획, 파일시스템, 서브에이전트 같은 batteries-included 하네스 기능을 제공한다.

### Choosing APIs
- 출처: https://docs.langchain.com/oss/python/langgraph/choosing-apis
- 확인 포인트:
  - Graph API는 명시적 흐름/상태가 중요할 때 적합하다.
  - Functional API는 함수형 흐름을 유지하면서 task 경계를 활용하고 싶을 때 더 간결하다.

### Workflows and agents
- 출처: https://docs.langchain.com/oss/python/langgraph/workflows-agents
- 확인 포인트:
  - Workflows는 정해진 코드 경로를, Agents는 동적인 도구 선택과 반복 실행을 담당한다.
  - 따라서 문제의 불확실성이 낮으면 workflow, 높으면 agent 쪽이 더 자연스럽다.

### Deep Agents Subagents
- 출처: https://docs.langchain.com/oss/python/deepagents/subagents
- 확인 포인트:
  - Subagents는 context bloat 완화와 전문 역할 분리에 적합하다.
  - 단순하고 한 번에 끝나는 작업에는 오버헤드가 될 수 있다.
